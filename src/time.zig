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

fn TimeZoneTo_time_zone_t(timezone: time.TimeZone) time_zone_t {
    switch (timezone) {
        .UTC => return time_zone_t.TIME_ZONE_UTC
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

fn EraTo_time_era(era: time.Era) time_era_t {
    switch (era) {
        .AD => return time_era_t.TIME_ERA_AD
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
        .era = EraTo_time_era(date_time.era)
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
        .era = EraTo_time_era(date_time.era)
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
        .era = EraTo_time_era(date_time.era)
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
        .era = EraTo_time_era(date_time.era)
    };
}
