package common

import (
	"encoding/json"
	"github.com/skynomads/cloudplane/operator/api/v1alpha1"
)

#appJson: string @tag(app)

app: v1alpha1.#App

app: json.Unmarshal(#appJson)
