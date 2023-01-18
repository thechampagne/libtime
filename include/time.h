/*
 * Copyright (c) 2023 XXIV
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
#ifndef __ZIG_TIME_H__
#define __ZIG_TIME_H__

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    TIME_ZONE_UTC
} time_zone_t;

typedef enum {
    TIME_WEEK_DAY_SUN,
    TIME_WEEK_DAY_MON,
    TIME_WEEK_DAY_TUE,
    TIME_WEEK_DAY_WED,
    TIME_WEEK_DAY_THU,
    TIME_WEEK_DAY_FRI,
    TIME_WEEK_DAY_SAT
} time_week_day_t;

typedef enum {
    TIME_ERA_AD
} time_era_t;

typedef struct {
  uint16_t ms;
  uint16_t seconds;
  uint16_t minutes;
  uint16_t hours;
  uint16_t days;
  uint16_t months;
  uint16_t years;
  time_zone_t timezone;
  time_week_day_t weekday;
  time_era_t era;
} time_date_time_t;

typedef enum {
    TIME_FORMAT_OPTIONS_ALIGNMENT_LEFT,
    TIME_FORMAT_OPTIONS_ALIGNMENT_CENTER,
    TIME_FORMAT_OPTIONS_ALIGNMENT_RIGHT
} time_format_options_alignment_t;

typedef struct {
  size_t precision;
  size_t width;
  time_format_options_alignment_t alignment;
  uint8_t fill;
} time_format_options_t;

extern time_date_time_t time_epoch_unix;

extern time_date_time_t time_date_time_init_unix_ms(uint64_t unix);

extern time_date_time_t time_date_time_init_unix(uint64_t unix);

extern time_date_time_t time_date_time_init(uint16_t year, uint16_t month, uint16_t day, uint16_t hr, uint16_t min, uint16_t sec);

extern time_date_time_t time_date_time_now();

extern int time_date_time_eql(const time_date_time_t* self, const time_date_time_t* other);

extern void time_date_time_add_ms(time_date_time_t* self, uint64_t count);

extern void time_date_time_add_secs(time_date_time_t* self, uint64_t count);

extern void time_date_time_add_mins(time_date_time_t* self, uint64_t count);

extern void time_date_time_add_hours(time_date_time_t* self, uint64_t count);

extern void time_date_time_add_days(time_date_time_t* self, uint64_t count);

extern void time_date_time_add_months(time_date_time_t* self, uint64_t count);

extern void time_date_time_add_years(time_date_time_t* self, uint64_t count);

extern int time_date_time_is_leap_year(const time_date_time_t* self);

extern uint16_t time_date_time_days_this_year(const time_date_time_t* self);

extern uint16_t time_date_time_days_this_month(const time_date_time_t* self);

extern uint16_t time_date_time_day_of_this_year(const time_date_time_t* self);

extern uint64_t time_date_time_to_unix_milli(const time_date_time_t* self);

extern int time_date_time_format(const time_date_time_t* self, const char* fmt, const time_format_options_t* options);

extern char* time_date_time_format_alloc(const time_date_time_t* self, const char* fmt);

extern int time_is_leap_year(uint16_t year);

extern uint16_t time_days_in_year(uint16_t year); 

#ifdef __cplusplus
}
#endif

#endif // __ZIG_TIME_H__
