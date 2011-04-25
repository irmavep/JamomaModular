#include "MinuitGetAnswer.hpp"

#ifdef TT_PLATFORM_WIN
	#include "Time2.hpp"
#endif

#include <iostream>
#include <sstream>

using namespace std;

MinuitGetAnswer::MinuitGetAnswer()
{
	m_state = NO_ANSWER;

	struct timeval tv;

#ifdef TT_PLATFORM_WIN
	Time2 time2;
	time2.gettimeofday(&tv, NULL);
#else
	struct timezone tz;
	gettimeofday(&tv, &tz);
#endif

	m_launchTimeInMs = (tv.tv_sec * 1000000L + tv.tv_usec)/1000;
	m_timeOutInMs = NO_TIMEOUT;
}

MinuitGetAnswer::~MinuitGetAnswer()
{
}

int MinuitGetAnswer::getState()
{
	if ((m_state == NO_ANSWER) && (m_timeOutInMs != NO_TIMEOUT)) {
		struct timeval tv;

#ifdef TT_PLATFORM_WIN
		Time2 time2;
		time2.gettimeofday(&tv, NULL);
#else
		struct timezone tz;
		gettimeofday(&tv, &tz);
#endif

		long long dt = 0;

		dt = (tv.tv_sec * 1000000L + tv.tv_usec)/1000 - m_launchTimeInMs;

		if (dt > m_timeOutInMs) {
			m_state = TIMEOUT_EXCEEDED;
		}
	}
	return m_state;
}
void MinuitGetAnswer::setTimeOut(int timeout) {
	m_timeOutInMs = timeout;
}

void MinuitGetAnswer::parseMinuitGetAnswer(const osc::ReceivedMessage&m)
{
	osc::ReceivedMessage::const_iterator arg = m.ArgumentsBegin();
	std::ostringstream ossWithAddress;
	std::ostringstream ossWithoutAddress;
	std::ostringstream floatCorrection;

	// get the address
	ossWithAddress << arg->AsString();
	m_getTTValueWithAddress.append(TT(arg->AsString()));
	++arg;
	
	while(arg != m.ArgumentsEnd()) {

		if (arg->IsChar()) {
			ossWithAddress  << arg->AsChar();
			ossWithoutAddress  << arg->AsChar();
			m_getTTValueWithAddress.append(arg->AsChar());
			m_getTTValueWithoutAddress.append(arg->AsChar());
		} else if (arg->IsInt32()) {
			ossWithAddress  << arg->AsInt32();
			ossWithoutAddress  << arg->AsInt32();
			m_getTTValueWithAddress.append((TTInt64)arg->AsInt32());
			m_getTTValueWithoutAddress.append((TTInt64)arg->AsInt32());
		} else if (arg->IsString()) {
			ossWithAddress  << arg->AsString();
			ossWithoutAddress  << arg->AsString();
			m_getTTValueWithAddress.append(TT(arg->AsString()));
			m_getTTValueWithoutAddress.append(TT(arg->AsString()));
		}else if (arg->IsFloat()) {
			floatCorrection.str("");

			floatCorrection << arg->AsFloat();

			TTString floatWithPoint = floatCorrection.str();

			if(floatWithPoint.find(".") == floatWithPoint.npos) {
				floatWithPoint = floatWithPoint + ".";
			}

			ossWithAddress  << floatWithPoint;
			ossWithoutAddress  << floatWithPoint;
			m_getTTValueWithAddress.append(arg->AsFloat());
			m_getTTValueWithoutAddress.append(arg->AsFloat());
		}

		++arg;
		if(arg != m.ArgumentsEnd()){
			ossWithAddress << " ";
			ossWithoutAddress << " ";
		}
	}

//	m_getStringWithAddress = ossWithAddress.str();
//	m_getStringWithoutAddress = ossWithoutAddress.str();
	
	m_state = ANSWER_RECEIVED;
}

TTValue MinuitGetAnswer::waitGetAnswer(bool withAddress)
{
	if (withAddress) {
		return m_getTTValueWithAddress;
	} else {
		return m_getTTValueWithoutAddress;
	}
}