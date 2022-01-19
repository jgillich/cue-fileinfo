package common

import (
	"strings"
	"github.com/skynomads/cloudplane/operator/pkg/template/common/k"
	mysqlv1alpha1 "github.com/bitpoke/mysql-operator/pkg/apis/mysql/v1alpha1"
)

let pool = app.metadata.labels["platform.cloudplane.org/pool"]
mysql: {
	secret: k.#Secret & {
		metadata: {
			name: "\(app.metadata.name)-mysql"
			annotations: {
				"secret-generator.v1.mittwald.de/autogenerate": "password"
			}
			labels: labels
		}
		stringData: {
			let name = strings.Replace(app.metadata.name, "-", "_", -1)
			host:     "\(pool)-mysql-mysql-master"
			username: name
			database: name
		}
	}

	database: mysqlv1alpha1.#MysqlDatabase & {
		kind:       "MysqlDatabase"
		apiVersion: "mysql.presslabs.org/v1alpha1"
		metadata: name: secret.metadata.name
		spec: {
			database: secret.stringData.database
			clusterRef: {
				name:      "\(pool)-mysql"
				namespace: app.metadata.namespace
			}
		}
	}

	databaseUser: mysqlv1alpha1.#MysqlUser & {
		kind:       "MysqlUser"
		apiVersion: "mysql.presslabs.org/v1alpha1"
		metadata: name: secret.metadata.name
		spec: {
			user:       secret.stringData.username
			clusterRef: database.spec.clusterRef
			password: {
				name: secret.metadata.name
				key:  "password"
			}
			allowedHosts: ["%"]
			permissions: [
				{
					schema: secret.stringData.database
					tables: ["*"]
					permissions: ["ALL"]
				},
			]
		}
	}

}
