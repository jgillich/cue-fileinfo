// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/zalando/postgres-operator/pkg/apis/acid.zalan.do/v1

package v1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// PostgresTeam defines Custom Resource Definition Object for team management.
#PostgresTeam: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec:      #PostgresTeamSpec  @go(Spec)
}

// PostgresTeamSpec defines the specification for the PostgresTeam TPR.
#PostgresTeamSpec: {
	additionalSuperuserTeams?: {[string]: [...string]} @go(AdditionalSuperuserTeams,map[string][]string)
	additionalTeams?: {[string]: [...string]} @go(AdditionalTeams,map[string][]string)
	additionalMembers?: {[string]: [...string]} @go(AdditionalMembers,map[string][]string)
}

// PostgresTeamList defines a list of PostgresTeam definitions.
#PostgresTeamList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)
	items: [...#PostgresTeam] @go(Items,[]PostgresTeam)
}
