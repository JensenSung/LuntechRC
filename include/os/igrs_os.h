/*
 * Copyright (C) 2007-2012 IGRSLab
 *
 * @author ouyangcf@igrslab.com
 * @date   2010-5-22
 *
 * @brief  IGRS 2.0 OS adapter 
 *
 * @file   igrs_os.h
 *
 * @remark
 *
 */


#ifndef _IGRS_OS_H_
#define _IGRS_OS_H_


#ifdef _WIN32

#include <windows.h>
#define snprintf _snprintf
typedef unsigned __int64 uint64_t; 

//void igrs_sleep(int ms);

#else /* Linux */

#include <stdint.h>
#include <pthread.h>
#include <unistd.h>
//void igrs_sleep(int ms);

#endif /* _WIN32 */


#endif /* _IGRS_OS_H_ */
