# libtime

[![](https://img.shields.io/github/v/tag/thechampagne/libtime?label=version)](https://github.com/thechampagne/libtime/releases/latest) [![](https://img.shields.io/github/license/thechampagne/libtime)](https://github.com/thechampagne/libtime/blob/main/LICENSE)

A date and time parsing and formatting library for **C**.

### Installation & Setup

#### 1. Clone the repository
```
git clone https://github.com/thechampagne/libtime.git
```
#### 2. Navigate to the root
```
cd libtime
```
#### 3. Build the project
```
zig build
```

### API
```c
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

time_date_time_t time_epoch_unix;

time_date_time_t time_date_time_init_unix_ms(uint64_t unix);

time_date_time_t time_date_time_init_unix(uint64_t unix);

time_date_time_t time_date_time_init(uint16_t year, uint16_t month, uint16_t day, uint16_t hr, uint16_t min, uint16_t sec);

time_date_time_t time_date_time_now();

int time_date_time_eql(const time_date_time_t* self, const time_date_time_t* other);

void time_date_time_add_ms(time_date_time_t* self, uint64_t count);

void time_date_time_add_secs(time_date_time_t* self, uint64_t count);

void time_date_time_add_mins(time_date_time_t* self, uint64_t count);

void time_date_time_add_hours(time_date_time_t* self, uint64_t count);

void time_date_time_add_days(time_date_time_t* self, uint64_t count);

void time_date_time_add_months(time_date_time_t* self, uint64_t count);

void time_date_time_add_years(time_date_time_t* self, uint64_t count);

int time_date_time_is_leap_year(const time_date_time_t* self);

uint16_t time_date_time_days_this_year(const time_date_time_t* self);

uint16_t time_date_time_days_this_month(const time_date_time_t* self);

uint16_t time_date_time_day_of_this_year(const time_date_time_t* self);

uint64_t time_date_time_to_unix_milli(const time_date_time_t* self);

int time_date_time_format(const time_date_time_t* self, const char* fmt, const time_format_options_t* options);

char* time_date_time_format_alloc(const time_date_time_t* self, const char* fmt);

int time_is_leap_year(uint16_t year);

uint16_t time_days_in_year(uint16_t year); 
```

### References
 - [time](https://github.com/nektro/zig-time)

### License

This repo is released under the [MIT](https://github.com/thechampagne/libtime/blob/main/LICENSE).
