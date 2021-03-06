// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/sirupsen/logrus

package logrus

_#defaultTimestampFormat: "2006-01-02T15:04:05Z07:00"
#FieldKeyMsg:             "msg"
#FieldKeyLevel:           "level"
#FieldKeyTime:            "time"
#FieldKeyLogrusError:     "logrus_error"
#FieldKeyFunc:            "func"
#FieldKeyFile:            "file"

// The Formatter interface is used to implement a custom Formatter. It takes an
// `Entry`. It exposes all the fields, including the default ones:
//
// * `entry.Data["msg"]`. The message passed from Info, Warn, Error ..
// * `entry.Data["time"]`. The timestamp.
// * `entry.Data["level"]. The level the entry was logged at.
//
// Any additional fields added with `WithField` or `WithFields` are also in
// `entry.Data`. Format is expected to return an array of bytes which are then
// logged to `logger.Out`.
#Formatter: _
