// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/sirupsen/logrus

package logrus

import (
	"time"
	"runtime"
	"context"
)

_#maximumCallerDepth: int & 25
_#knownLogrusFrames:  int & 4

// An entry is the final or intermediate Logrus logging entry. It contains all
// the fields passed with WithField{,s}. It's finally logged when Trace, Debug,
// Info, Warn, Error, Fatal or Panic is called on it. These objects can be
// reused and passed around as much as you wish to avoid field duplication.
#Entry: {
	Logger?: null | #Logger @go(,*Logger)

	// Contains all the fields set by the user.
	Data: #Fields

	// Time at which the log entry was created
	Time: time.Time

	// Level the log entry was logged at: Trace, Debug, Info, Warn, Error, Fatal or Panic
	// This field will be set on entry firing and the value will be equal to the one in Logger struct field.
	Level: #Level

	// Calling method, with package name
	Caller?: null | runtime.#Frame @go(,*runtime.Frame)

	// Message passed to Trace, Debug, Info, Warn, Error, Fatal or Panic
	Message: string

	// Contains the context set by the user. Useful for hook processing etc.
	Context: context.#Context
}
