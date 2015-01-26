/*
 * Copyright (C) 2007-2012 IGRSLab
 *
 * \author fanjx@igrslab.com
 * \date   2011-07-25
 *
 * \brief  igrs macros 
 *
 * \file   igrsmacros.h
 *
 * \remark
 *      set tabstop=4
 *      set shiftwidth=4
 *      set expandtab
 */


#ifndef _IGRS_MACROS_H_
#define _IGRS_MACROS_H_

#if defined( _WIN32 ) && !defined( __SYMBIAN32__ )
#  if defined( IGRS_EXPORTS ) || defined( DLL_EXPORT )
#    define IGRS_API __declspec( dllexport )
#  else
#    if defined( IGRS_IMPORTS ) || defined( DLL_IMPORT )
#      define IGRS_API __declspec( dllimport )
#    endif
#  endif
#endif

#ifndef IGRS_API
#ifdef WIN32
#  define IGRS_API __declspec(dllexport)
#endif
#endif


#if defined( __GNUC__ ) && ( __GNUC__ - 0 > 3 || ( __GNUC__ - 0 == 3 && __GNUC_MINOR__ - 0 >= 2 ) )
#  define IGRS_DEPRECATED __attribute__ ( (__deprecated__) )
#  define IGRS_DEPRECATED_CTOR explicit IGRS_DEPRECATED
#elif defined( _MSC_VER ) && ( _MSC_VER >= 1300 )
#  define IGRS_DEPRECATED __declspec( deprecated )
#  define IGRS_DEPRECATED_CTOR explicit IGRS_DEPRECATED
#else
#  define IGRS_DEPRECATED
#  define IGRS_DEPRECATED_CTOR
#endif

#endif /*_IGRS_MACROS_H_*/
