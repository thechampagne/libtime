const std = @import("std");
const time = @import("time");

const time_zone_t = enum(c_int) {
    TIME_ZONE_UTC
};

const time_week_day_t = enum(c_int) {
    TIME_WEEK_DAY_SUN,
    TIME_WEEK_DAY_MON,
    TIME_WEEK_DAY_TUE,
    TIME_WEEK_DAY_WED,
    TIME_WEEK_DAY_THU,
    TIME_WEEK_DAY_FRI,
    TIME_WEEK_DAY_SAT
};

const time_era_t = enum(c_int) {
    TIME_ERA_AD
};

const time_date_time_t = extern struct {
    ms: u16,
    seconds: u16,
    minutes: u16,
    hours: u16,
    days: u16,
    months: u16,
    years: u16,
    timezone: time_zone_t,
    weekday: time_week_day_t,
    era: time_era_t,
};

const time_format_options_alignment_t = enum(c_int) {
    TIME_FORMAT_OPTIONS_ALIGNMENT_LEFT,
    TIME_FORMAT_OPTIONS_ALIGNMENT_CENTER,
    TIME_FORMAT_OPTIONS_ALIGNMENT_RIGHT
};

const time_format_options_t = extern struct {
    precision: usize,
    width: usize,
    alignment: time_format_options_alignment_t,
    fill: u8,
};

export const time_epoch_unix = time_date_time_t {
    .ms = 0,
    .seconds = 0,
    .minutes = 0,
    .hours = 0,
    .days = 0,
    .months = 0,
    .years = 1970,
    .timezone = .TIME_ZONE_UTC,
    .weekday = .TIME_WEEK_DAY_THU,
    .era = .TIME_ERA_AD,
};

fn time_format_options_alignment_t_toAlignment(alignment: time_format_options_alignment_t) std.fmt.Alignment {
    switch (alignment) {
        .TIME_FORMAT_OPTIONS_ALIGNMENT_LEFT => return std.fmt.Alignment.Left,
        .TIME_FORMAT_OPTIONS_ALIGNMENT_CENTER => return std.fmt.Alignment.Center,
        .TIME_FORMAT_OPTIONS_ALIGNMENT_RIGHT => return std.fmt.Alignment.Right
    }
}

fn TimeZoneTo_time_zone_t(timezone: time.TimeZone) time_zone_t {
    switch (timezone) {
        .UTC => return time_zone_t.TIME_ZONE_UTC
    }
}

fn time_zone_t_toTimeZone(timezone: time_zone_t) time.TimeZone {
    switch (timezone) {
        .TIME_ZONE_UTC => return time.TimeZone.UTC
    }
}

fn WeekDayTo_time_zone_t(weekday: time.WeekDay) time_week_day_t {
    switch (weekday) {
        .Sun => return time_week_day_t.TIME_WEEK_DAY_SUN,
        .Mon => return time_week_day_t.TIME_WEEK_DAY_MON,
        .Tue => return time_week_day_t.TIME_WEEK_DAY_TUE,
        .Wed => return time_week_day_t.TIME_WEEK_DAY_WED,
        .Thu => return time_week_day_t.TIME_WEEK_DAY_THU,
        .Fri => return time_week_day_t.TIME_WEEK_DAY_FRI,
        .Sat => return time_week_day_t.TIME_WEEK_DAY_SAT,
    }
}

fn time_zone_t_toWeekDay(weekday: time_week_day_t) time.WeekDay {
    switch (weekday) {
        .TIME_WEEK_DAY_SUN => return time.WeekDay.Sun,
        .TIME_WEEK_DAY_MON => return time.WeekDay.Mon,
        .TIME_WEEK_DAY_TUE => return time.WeekDay.Tue,
        .TIME_WEEK_DAY_WED => return time.WeekDay.Wed,
        .TIME_WEEK_DAY_THU => return time.WeekDay.Thu,
        .TIME_WEEK_DAY_FRI => return time.WeekDay.Fri,
        .TIME_WEEK_DAY_SAT => return time.WeekDay.Sat,
    }
}

fn EraTo_time_era_t(era: time.Era) time_era_t {
    switch (era) {
        .AD => return time_era_t.TIME_ERA_AD
    }
}

fn time_era_t_toEra(era: time_era_t) time.Era {
    switch (era) {
        .TIME_ERA_AD => return time.Era.AD
    }
}

export fn time_date_time_init_unix_ms(unix: u64) time_date_time_t {
    const date_time = time.DateTime.initUnixMs(unix);
    return time_date_time_t {
        .ms = date_time.ms,
        .seconds = date_time.seconds,
        .minutes = date_time.minutes,
        .hours = date_time.hours,
        .days = date_time.days,
        .months = date_time.months,
        .years = date_time.years,
        .timezone = TimeZoneTo_time_zone_t(date_time.timezone),
        .weekday = WeekDayTo_time_zone_t(date_time.weekday),
        .era = EraTo_time_era_t(date_time.era)
    };
}

export fn time_date_time_init_unix(unix: u64) time_date_time_t {
    const date_time = time.DateTime.initUnix(unix);
    return time_date_time_t {
        .ms = date_time.ms,
        .seconds = date_time.seconds,
        .minutes = date_time.minutes,
        .hours = date_time.hours,
        .days = date_time.days,
        .months = date_time.months,
        .years = date_time.years,
        .timezone = TimeZoneTo_time_zone_t(date_time.timezone),
        .weekday = WeekDayTo_time_zone_t(date_time.weekday),
        .era = EraTo_time_era_t(date_time.era)
    };
}

export fn time_date_time_init(year: u16, month: u16, day: u16, hr: u16, min: u16, sec: u16) time_date_time_t {
    const date_time = time.DateTime.init(year, month, day, hr, min, sec);
    return time_date_time_t {
        .ms = date_time.ms,
        .seconds = date_time.seconds,
        .minutes = date_time.minutes,
        .hours = date_time.hours,
        .days = date_time.days,
        .months = date_time.months,
        .years = date_time.years,
        .timezone = TimeZoneTo_time_zone_t(date_time.timezone),
        .weekday = WeekDayTo_time_zone_t(date_time.weekday),
        .era = EraTo_time_era_t(date_time.era)
    };
}

export fn time_date_time_now() time_date_time_t {
    const date_time = time.DateTime.now();
    return time_date_time_t {
        .ms = date_time.ms,
        .seconds = date_time.seconds,
        .minutes = date_time.minutes,
        .hours = date_time.hours,
        .days = date_time.days,
        .months = date_time.months,
        .years = date_time.years,
        .timezone = TimeZoneTo_time_zone_t(date_time.timezone),
        .weekday = WeekDayTo_time_zone_t(date_time.weekday),
        .era = EraTo_time_era_t(date_time.era)
    };
}

export fn time_date_time_eql(self: *const time_date_time_t, other: *const time_date_time_t) c_int {
        if ( self.*.ms == other.*.ms and
            self.*.seconds == other.*.seconds and
            self.*.minutes == other.*.minutes and
            self.*.hours == other.*.hours and
            self.*.days == other.*.days and
            self.*.months == other.*.months and
            self.*.years == other.*.years and
            self.*.timezone == other.*.timezone and
                self.*.weekday == other.*.weekday) {
            return 1;
    } else {
            return 0;
    }
}

export fn time_date_time_add_ms(self: *time_date_time_t, count: u64) void {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const result = date_time.addMs(count);
    self.*.ms = result.ms;
    self.*.seconds = result.seconds;
    self.*.minutes = result.minutes;
    self.*.hours = result.hours;
    self.*.days = result.days;
    self.*.months = result.months;
    self.*.years = result.years;
    self.*.timezone = TimeZoneTo_time_zone_t(result.timezone);
    self.*.weekday = WeekDayTo_time_zone_t(result.weekday);
    self.*.era = EraTo_time_era_t(result.era);
}

export fn time_date_time_add_secs(self: *time_date_time_t, count: u64) void {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const result = date_time.addSecs(count);
    self.*.ms = result.ms;
    self.*.seconds = result.seconds;
    self.*.minutes = result.minutes;
    self.*.hours = result.hours;
    self.*.days = result.days;
    self.*.months = result.months;
    self.*.years = result.years;
    self.*.timezone = TimeZoneTo_time_zone_t(result.timezone);
    self.*.weekday = WeekDayTo_time_zone_t(result.weekday);
    self.*.era = EraTo_time_era_t(result.era);
}

export fn time_date_time_add_mins(self: *time_date_time_t, count: u64) void {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const result = date_time.addMins(count);
    self.*.ms = result.ms;
    self.*.seconds = result.seconds;
    self.*.minutes = result.minutes;
    self.*.hours = result.hours;
    self.*.days = result.days;
    self.*.months = result.months;
    self.*.years = result.years;
    self.*.timezone = TimeZoneTo_time_zone_t(result.timezone);
    self.*.weekday = WeekDayTo_time_zone_t(result.weekday);
    self.*.era = EraTo_time_era_t(result.era);
}

export fn time_date_time_add_hours(self: *time_date_time_t, count: u64) void {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const result = date_time.addHours(count);
    self.*.ms = result.ms;
    self.*.seconds = result.seconds;
    self.*.minutes = result.minutes;
    self.*.hours = result.hours;
    self.*.days = result.days;
    self.*.months = result.months;
    self.*.years = result.years;
    self.*.timezone = TimeZoneTo_time_zone_t(result.timezone);
    self.*.weekday = WeekDayTo_time_zone_t(result.weekday);
    self.*.era = EraTo_time_era_t(result.era);
}

export fn time_date_time_add_days(self: *time_date_time_t, count: u64) void {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const result = date_time.addDays(count);
    self.*.ms = result.ms;
    self.*.seconds = result.seconds;
    self.*.minutes = result.minutes;
    self.*.hours = result.hours;
    self.*.days = result.days;
    self.*.months = result.months;
    self.*.years = result.years;
    self.*.timezone = TimeZoneTo_time_zone_t(result.timezone);
    self.*.weekday = WeekDayTo_time_zone_t(result.weekday);
    self.*.era = EraTo_time_era_t(result.era);
}

export fn time_date_time_add_months(self: *time_date_time_t, count: u64) void {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const result = date_time.addMonths(count);
    self.*.ms = result.ms;
    self.*.seconds = result.seconds;
    self.*.minutes = result.minutes;
    self.*.hours = result.hours;
    self.*.days = result.days;
    self.*.months = result.months;
    self.*.years = result.years;
    self.*.timezone = TimeZoneTo_time_zone_t(result.timezone);
    self.*.weekday = WeekDayTo_time_zone_t(result.weekday);
    self.*.era = EraTo_time_era_t(result.era);
}

export fn time_date_time_add_years(self: *time_date_time_t, count: u64) void {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const result = date_time.addYears(count);
    self.*.ms = result.ms;
    self.*.seconds = result.seconds;
    self.*.minutes = result.minutes;
    self.*.hours = result.hours;
    self.*.days = result.days;
    self.*.months = result.months;
    self.*.years = result.years;
    self.*.timezone = TimeZoneTo_time_zone_t(result.timezone);
    self.*.weekday = WeekDayTo_time_zone_t(result.weekday);
    self.*.era = EraTo_time_era_t(result.era);
}

export fn time_date_time_is_leap_year(self: *const time_date_time_t) c_int {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    if (date_time.isLeapYear()) {
        return 1;
    } else {
        return 0;
    }
}

export fn time_date_time_days_this_year(self: *const time_date_time_t) u16 {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    return date_time.daysThisYear();
}

export fn time_date_time_days_this_month(self: *const time_date_time_t) u16 {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    return date_time.daysThisMonth();
}

export fn time_date_time_day_of_this_year(self: *const time_date_time_t) u16 {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    return date_time.dayOfThisYear();
}

export fn time_date_time_to_unix_milli(self: *const time_date_time_t) u64 {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    return date_time.toUnixMilli();
}

export fn time_date_time_format(self: *const time_date_time_t, fmt: [*c]const u8, options: *const time_format_options_t) c_int {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    const fmt_options = std.fmt.FormatOptions {
        .precision = options.*.precision,
        .width = options.*.width,
        .alignment = time_format_options_alignment_t_toAlignment(options.*.alignment),
        .fill = options.*.fill,
    };
    date_time.format(std.mem.span(fmt), fmt_options, std.io.getStdOut().writer()) catch return 1;
    return 0;
}

export fn time_date_time_format_alloc(self: *const time_date_time_t, fmt: [*c]const u8) [*c]const u8 {
    const date_time = time.DateTime {
        .ms = self.*.ms,
        .seconds = self.*.seconds,
        .minutes = self.*.minutes,
        .hours = self.*.hours,
        .days = self.*.days,
        .months = self.*.months,
        .years = self.*.years,
        .timezone = time_zone_t_toTimeZone(self.*.timezone),
        .weekday = time_zone_t_toWeekDay(self.*.weekday),
        .era = time_era_t_toEra(self.*.era)
    };
    var res = date_time.formatAlloc(std.heap.c_allocator, std.mem.span(fmt)) catch return null;
    return res.ptr;
}

export fn time_is_leap_year(year: u16) c_int {
    var ret: c_int = 0;
    if (year % 4 == 0) ret = 1;
    if (year % 100 == 0) ret = 0;
    if (year % 400 == 0) ret = 1;
    return ret;
}

export fn time_days_in_year(year: u16) u16 {
    return if (time_is_leap_year(year) == 1) 366 else 365;
}
