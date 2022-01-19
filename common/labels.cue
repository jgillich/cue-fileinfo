package common

labels: {
	"platform.cloudplane.org/app":  app.metadata.name
	"platform.cloudplane.org/pool": app.metadata.labels["platform.cloudplane.org/pool"]
	"app.kubernetes.io/part-of":    app.spec.type
	"app.kubernetes.io/managed-by": "cloudplane"
	"app.kubernetes.io/instance":   app.metadata.name
}
