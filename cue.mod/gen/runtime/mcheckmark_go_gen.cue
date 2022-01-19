// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go runtime

package runtime

// A checkmarksMap stores the GC marks in "checkmarks" mode. It is a
// per-arena bitmap with a bit for every word in the arena. The mark
// is stored on the bit corresponding to the first word of the marked
// allocation.
//
//go:notinheap
_#checkmarksMap: 1048576 * [uint8]