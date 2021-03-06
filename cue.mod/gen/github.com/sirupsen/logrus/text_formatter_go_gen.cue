// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/sirupsen/logrus

package logrus

_#red:    31
_#yellow: 33
_#blue:   36
_#gray:   37

// TextFormatter formats logs into text
#TextFormatter: {
	// Set to true to bypass checking for a TTY before outputting colors.
	ForceColors: bool

	// Force disabling colors.
	DisableColors: bool

	// Force quoting of all values
	ForceQuote: bool

	// DisableQuote disables quoting for all values.
	// DisableQuote will have a lower priority than ForceQuote.
	// If both of them are set to true, quote will be forced on all values.
	DisableQuote: bool

	// Override coloring based on CLICOLOR and CLICOLOR_FORCE. - https://bixense.com/clicolors/
	EnvironmentOverrideColors: bool

	// Disable timestamp logging. useful when output is redirected to logging
	// system that already adds timestamps.
	DisableTimestamp: bool

	// Enable logging the full timestamp when a TTY is attached instead of just
	// the time passed since beginning of execution.
	FullTimestamp: bool

	// TimestampFormat to use for display when a full timestamp is printed.
	// The format to use is the same than for time.Format or time.Parse from the standard
	// library.
	// The standard Library already provides a set of predefined format.
	TimestampFormat: string

	// The fields are sorted by default for a consistent output. For applications
	// that log extremely frequently and don't use the JSON formatter this may not
	// be desired.
	DisableSorting: bool

	// Disables the truncation of the level text to 4 characters.
	DisableLevelTruncation: bool

	// PadLevelText Adds padding the level text so that all the levels output at the same length
	// PadLevelText is a superset of the DisableLevelTruncation option
	PadLevelText: bool

	// QuoteEmptyFields will wrap empty fields in quotes if true
	QuoteEmptyFields: bool

	// FieldMap allows users to customize the names of keys for default fields.
	// As an example:
	// formatter := &TextFormatter{
	//     FieldMap: FieldMap{
	//         FieldKeyTime:  "@timestamp",
	//         FieldKeyLevel: "@level",
	//         FieldKeyMsg:   "@message"}}
	FieldMap: #FieldMap
}
