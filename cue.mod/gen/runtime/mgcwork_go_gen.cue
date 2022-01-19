// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go runtime

package runtime

_#_WorkbufSize: 2048

// workbufAlloc is the number of bytes to allocate at a time
// for new workbufs. This must be a multiple of pageSize and
// should be a multiple of _WorkbufSize.
//
// Larger values reduce workbuf allocation overhead. Smaller
// values reduce heap fragmentation.
_#workbufAlloc: 32768
