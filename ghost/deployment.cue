package ghost

import (
	"github.com/skynomads/cloudplane/operator/pkg/template/common"
	"github.com/skynomads/cloudplane/operator/pkg/template/common/k"
)

resources: deployment: k.#Deployment & {
	metadata: {
		name:   common.app.metadata.name
		labels: common.labels & {
			"app.kubernetes.io/name":      "ghost"
			"app.kubernetes.io/component": "ghost"
			//"app.kubernetes.io/version":   "TODO"
		}
	}
	spec: {
		selector: {
			matchLabels: {
				"app.kubernetes.io/instance": common.app.metadata.name
			}
		}
		replicas: 1
		template: {
			metadata: {
				labels: deployment.metadata.labels
			}
			spec: {
				initContainers: [
					{
						name:  "volume-permissions"
						image: "bitnami/bitnami-shell:latest"
						command: ["/bin/bash"]
						args: [
							"-ec",
							"""
                mkdir -p /bitnami/ghost
                chown -R "1001:1001" /bitnami/ghost
                """,
						]
					},
				]
				containers: [
					{
						name:  "ghost"
						image: "bitnami/ghost:4.32.3"
						ports: [
							{containerPort: 80, name: "http"},
						]
						securityContext: {
							runAsUser:    1001
							runAsNonRoot: true
						}
						readinessProbe: {
							httpGet: {
								path:   "/"
								port:   "http"
								scheme: "HTTP"
							}
						}
						livenessProbe: {
							httpGet: {
								path:   "/"
								port:   "http"
								scheme: "HTTP"
							}
							initialDelaySeconds: 60
						}
						volumeMounts: [
							{
								name:      "ghost-data"
								mountPath: "/bitnami/ghost"
							},
						]
						env: [
							{name: "GHOST_EMAIL", value:         #values.email},
							{name: "GHOST_PASSWORD", value:      #values.password},
							{name: "GHOST_PORT_NUMBER", value:   "80"},
							{name: "GHOST_DATABASE_HOST", value: common.mysql.secret.stringData.host},
							{
								name: "GHOST_DATABASE_USER"
								valueFrom: {
									secretKeyRef: {
										name: common.mysql.secret.metadata.name
										key:  "username"
									}
								}
							},
							{
								name: "GHOST_DATABASE_PASSWORD"
								valueFrom: {
									secretKeyRef: {
										name: common.mysql.secret.metadata.name
										key:  "password"
									}
								}
							},

						]
					},
				]
				volumes: [
					{
						name: "ghost-data"
						persistentVolumeClaim: {
							claimName: common.app.metadata.name
						}
					},
				]
			}
		}
	}
}
