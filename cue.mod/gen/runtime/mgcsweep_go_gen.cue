// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go runtime

package runtime

// sweepClass is a spanClass and one bit to represent whether we're currently
// sweeping partial or full spans.
_#sweepClass: uint32

_#numSweepClasses: 272
_#sweepClassDone:  _#sweepClass & 4294967295
