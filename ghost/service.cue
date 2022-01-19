package ghost

import (
	"github.com/skynomads/cloudplane/operator/pkg/template/common/k"
	"github.com/skynomads/cloudplane/operator/pkg/template/common"
)

resources: service: k.#Service & {
	metadata: {
		name:   common.app.metadata.name
		labels: common.labels & {
			"app.kubernetes.io/name":      "ghost"
			"app.kubernetes.io/component": "ghost"
		}
	}
	spec: {
		type: "ClusterIP"
		selector: {
			"app.kubernetes.io/instance": common.app.metadata.name
		}
		ports: [{name: "http", protocol: "TCP", port: 80, targetPort: "http"}]

	}
}
