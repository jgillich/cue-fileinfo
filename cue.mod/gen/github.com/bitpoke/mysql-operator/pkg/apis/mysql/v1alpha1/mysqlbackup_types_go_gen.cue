// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/bitpoke/mysql-operator/pkg/apis/mysql/v1alpha1

package v1alpha1

import (
	core "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// MysqlBackupSpec defines the desired state of MysqlBackup
#MysqlBackupSpec: {
	// ClustterName represents the cluster for which to take backup
	clusterName: string @go(ClusterName)

	// BackupURL represents the URL to the backup location, this can be
	// partially specifyied. Default is used the one specified in the cluster.
	// +optional
	backupURL?: string @go(BackupURL)

	// BackupSecretName the name of secrets that contains the credentials to
	// access the bucket. Default is used the secret specified in cluster.
	// +optional
	backupSecretName?: string @go(BackupSecretName)

	// RemoteDeletePolicy the deletion policy that specify how to treat the data from remote storage. By
	// default it's used softDelete.
	// +optional
	remoteDeletePolicy?: #DeletePolicy @go(RemoteDeletePolicy)
}

// BackupCondition defines condition struct for backup resource
#BackupCondition: {
	// type of cluster condition, values in (\"Ready\")
	type: #BackupConditionType @go(Type)

	// Status of the condition, one of (\"True\", \"False\", \"Unknown\")
	status: core.#ConditionStatus @go(Status)

	// LastTransitionTime
	lastTransitionTime: metav1.#Time @go(LastTransitionTime)

	// Reason
	reason: string @go(Reason)

	// Message
	message: string @go(Message)
}

// BackupConditionType defines condition types of a backup resources
#BackupConditionType: string // #enumBackupConditionType

#enumBackupConditionType:
	#BackupComplete |
	#BackupFailed

// BackupComplete means the backup has finished his execution
#BackupComplete: #BackupConditionType & "Complete"

// BackupFailed means backup has failed
#BackupFailed: #BackupConditionType & "Failed"

// DeletePolicy defines the types of policies for backup deletions are
#DeletePolicy: string // #enumDeletePolicy

#enumDeletePolicy:
	#Delete |
	#Retain

// Delete when used it will try to delete the backup from remote storage then will remove the
// MysqlBackup resource from Kubernetes. The remote deletion is not guaranteed that will succeed.
#Delete: #DeletePolicy & "delete"

// Retain when used it will delete only the MysqlBackup resource from Kuberentes and will keep the backup
// on remote storage.
#Retain: #DeletePolicy & "retain"

// MysqlBackupStatus defines the observed state of MysqlBackup
#MysqlBackupStatus: {
	// Completed indicates whether the backup is in a final state,
	// no matter whether its' corresponding job failed or succeeded
	completed?: bool @go(Completed)

	// Conditions represents the backup resource conditions list.
	conditions?: [...#BackupCondition] @go(Conditions,[]BackupCondition)
}

// MysqlBackup is the Schema for the mysqlbackups API
// +kubebuilder:object:root=true
//
#MysqlBackup: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #MysqlBackupSpec   @go(Spec)
	status?:   #MysqlBackupStatus @go(Status)
}

// MysqlBackupList contains a list of MysqlBackup
// +kubebuilder:object:root=true
//
#MysqlBackupList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#MysqlBackup] @go(Items,[]MysqlBackup)
}
