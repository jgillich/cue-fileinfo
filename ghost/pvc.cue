package ghost

import (
	"github.com/skynomads/cloudplane/operator/pkg/template/common/k"
	"github.com/skynomads/cloudplane/operator/pkg/template/common"
)

resources: pvc: k.#PersistentVolumeClaim & {
	metadata: {
		name:   common.app.metadata.name
		labels: common.labels & {
			"app.kubernetes.io/name":      "ghost"
			"app.kubernetes.io/component": "ghost"
		}
	}
	spec: {
		accessModes: ["ReadWriteOnce"]
		resources: {
			requests: {
				storage: common.app.spec.blockStorage.size
			}
		}
	}
}
