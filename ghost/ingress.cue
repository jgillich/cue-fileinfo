package ghost

import (
	"github.com/skynomads/cloudplane/operator/pkg/template/common/k"
	"github.com/skynomads/cloudplane/operator/pkg/template/common"
)

resources: ingress: k.#Ingress & {
	metadata: {
		name:   common.app.metadata.name
		labels: common.labels & {
			"app.kubernetes.io/name":      "ghost"
			"app.kubernetes.io/component": "ghost"
		}
	}
	spec: {
		tls: [
			{
				hosts: [common.app.spec.domains.primary]
				secretName: "\(common.app.spec.domains.primary)-tls"
			},
		]
		rules: [
			{
				host: common.app.spec.domains.primary
				http: {
					paths: [
						{
							path:     "/"
							pathType: "Prefix"
							backend: {
								service: {
									name: common.app.metadata.name
									port: {name: "http"}
								}
							}
						},
					]
				}
			},
		]
	}
}
