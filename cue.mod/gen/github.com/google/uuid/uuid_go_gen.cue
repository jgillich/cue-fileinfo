// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/google/uuid

package uuid

// A UUID is a 128 bit (16 byte) Universal Unique IDentifier as defined in RFC
// 4122.
#UUID: string

// A Version represents a UUID's version.
#Version: byte

// A Variant represents a UUID's variant.
#Variant: byte // #enumVariant

#enumVariant:
	#Invalid |
	#RFC4122 |
	#Reserved |
	#Microsoft |
	#Future

#values_Variant: {
	Invalid:   #Invalid
	RFC4122:   #RFC4122
	Reserved:  #Reserved
	Microsoft: #Microsoft
	Future:    #Future
}

#Invalid:   #Variant & 0
#RFC4122:   #Variant & 1
#Reserved:  #Variant & 2
#Microsoft: #Variant & 3
#Future:    #Variant & 4

_#randPoolSize: 256