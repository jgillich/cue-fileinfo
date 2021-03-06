// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go runtime

package runtime

_#fixedRootFinalizers:  0
_#fixedRootFreeGStacks: 1
_#fixedRootCount:       2

// rootBlockBytes is the number of bytes to scan per data or
// BSS root.
_#rootBlockBytes: 262144

// maxObletBytes is the maximum bytes of an object to scan at
// once. Larger objects will be split up into "oblets" of at
// most this size. Since we can scan 1–2 MB/ms, 128 KB bounds
// scan preemption at ~100 µs.
//
// This must be > _MaxSmallSize so that the object base is the
// span base.
_#maxObletBytes: 131072

// drainCheckThreshold specifies how many units of work to do
// between self-preemption checks in gcDrain. Assuming a scan
// rate of 1 MB/ms, this is ~100 µs. Lower values have higher
// overhead in the scan loop (the scheduler check may perform
// a syscall, so its overhead is nontrivial). Higher values
// make the system less responsive to incoming work.
_#drainCheckThreshold: 100000

// pagesPerSpanRoot indicates how many pages to scan from a span root
// at a time. Used by special root marking.
//
// Higher values improve throughput by increasing locality, but
// increase the minimum latency of a marking operation.
//
// Must be a multiple of the pageInUse bitmap element size and
// must also evenly divide pagesPerArena.
_#pagesPerSpanRoot: 512

_#gcDrainFlags: int

_#gcDrainUntilPreempt:  _#gcDrainFlags & 1
_#gcDrainFlushBgCredit: _#gcDrainFlags & 2
_#gcDrainIdle:          _#gcDrainFlags & 4
_#gcDrainFractional:    _#gcDrainFlags & 8
