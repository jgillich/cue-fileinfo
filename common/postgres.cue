import (
	"github.com/skynomads/cloudplane/operator/api/v1alpha1"
)

#PostgresDatabase: v1alpha1.#PostgresDatabase & {
	apiVersion: "platform.cloudplane.org/v1alpha1"
	kind:       "PostgresDatabase"
	metadata: {
		name: app.metdata.name
	}
	spec: {

	}
}
