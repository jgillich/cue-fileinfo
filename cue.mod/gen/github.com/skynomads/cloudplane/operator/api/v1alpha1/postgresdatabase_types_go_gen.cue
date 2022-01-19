// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/skynomads/cloudplane/operator/api/v1alpha1

package v1alpha1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// PostgresDatabaseSpec defines the desired state of PostgresDatabase
#PostgresDatabaseSpec: {
	// The name of the database. Must be unique on the PostgreSQL server instance where it is configured.
	name?: string @go(Name)
	usernameKeys?: [...string] @go(UsernameKeys,[]string)
	passwordKeys?: [...string] @go(PasswordKeys,[]string)
}

// PostgresDatabaseStatus defines the observed state of PostgresDatabase
#PostgresDatabaseStatus: {
	created: string @go(Created)
}

// +kubebuilder:printcolumn:name="Platform",type=string,JSONPath=`.spec.platform`
// PostgresDatabase is the Schema for the postgresdatabases API
#PostgresDatabase: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta      @go(ObjectMeta)
	spec?:     #PostgresDatabaseSpec   @go(Spec)
	status?:   #PostgresDatabaseStatus @go(Status)
}

// PostgresDatabaseList contains a list of PostgresDatabase
#PostgresDatabaseList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#PostgresDatabase] @go(Items,[]PostgresDatabase)
}
