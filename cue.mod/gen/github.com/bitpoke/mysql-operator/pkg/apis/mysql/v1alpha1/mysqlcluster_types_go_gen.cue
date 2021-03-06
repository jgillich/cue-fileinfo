// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/bitpoke/mysql-operator/pkg/apis/mysql/v1alpha1

package v1alpha1

import (
	"k8s.io/apimachinery/pkg/api/resource"
	"k8s.io/apimachinery/pkg/util/intstr"
	core "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// MysqlClusterSpec defines the desired state of MysqlCluster
// nolint: maligned
#MysqlClusterSpec: {
	// The number of pods. This updates replicas filed
	// Defaults to 0
	// +optional
	replicas?: null | int32 @go(Replicas,*int32)

	// The secret name that contains connection information to initialize database, like
	// USER, PASSWORD, ROOT_PASSWORD and so on
	// This secret will be updated with DB_CONNECT_URL and some more configs.
	// Can be specified partially
	// +kubebuilder:validation:MinLength=1
	// +kubebuilder:validation:MaxLength=63
	secretName: string @go(SecretName)

	// Represents the MySQL version that will be run. The available version can be found here:
	// https://github.com/bitpoke/mysql-operator/blob/0fd4641ce4f756a0aab9d31c8b1f1c44ee10fcb2/pkg/util/constants/constants.go#L87
	// This field should be set even if the Image is set to let the operator know which mysql version is running.
	// Based on this version the operator can take decisions which features can be used.
	// Defaults to 5.7
	// +optional
	mysqlVersion?: string @go(MysqlVersion)

	// To specify the image that will be used for mysql server container.
	// If this is specified then the mysqlVersion is used as source for MySQL server version.
	// +optional
	image?: string @go(Image)

	// A bucket URL that contains a xtrabackup to initialize the mysql database.
	// +optional
	initBucketURL?: string @go(InitBucketURL)

	// Same as InitBucketURL but is DEPRECATED
	// +optional
	initBucketURI?:        string @go(InitBucketURI)
	initBucketSecretName?: string @go(InitBucketSecretName)

	// The number of pods from that set that must still be available after the
	// eviction, even in the absence of the evicted pod
	// Defaults to 50%
	// +optional
	minAvailable?: string @go(MinAvailable)

	// Specify under crontab format interval to take backups
	// leave it empty to deactivate the backup process
	// Defaults to ""
	// +optional
	backupSchedule?: string @go(BackupSchedule)

	// Represents an URL to the location where to put backups.
	// +optional
	backupURL?: string @go(BackupURL)

	// BackupRemoteDeletePolicy the deletion policy that specify how to treat the data from remote storage. By
	// default it's used softDelete.
	// +optional
	backupRemoteDeletePolicy?: #DeletePolicy @go(BackupRemoteDeletePolicy)

	// Represents the name of the secret that contains credentials to connect to
	// the storage provider to store backups.
	// +optional
	backupSecretName?: string @go(BackupSecretName)

	// If set keeps last BackupScheduleJobsHistoryLimit Backups
	// +optional
	backupScheduleJobsHistoryLimit?: null | int @go(BackupScheduleJobsHistoryLimit,*int)

	// A map[string]string that will be passed to my.cnf file.
	// +optional
	mysqlConf?: #MysqlConf @go(MysqlConf)

	// Pod extra specification
	// +optional
	podSpec?: #PodSpec @go(PodSpec)

	// PVC extra specifiaction
	// +optional
	volumeSpec?: #VolumeSpec @go(VolumeSpec)

	// TmpfsSize if specified, mounts a tmpfs of this size into /tmp
	// DEPRECATED: use instead PodSpec.Volumes and PodSpec.VolumeMounts
	// +optional
	tmpfsSize?: null | resource.#Quantity @go(TmpfsSize,*resource.Quantity)

	// MaxSlaveLatency represents the allowed latency for a slave node in
	// seconds. If set then the node with a latency grater than this is removed
	// from service.
	// +optional
	maxSlaveLatency?: null | int64 @go(MaxSlaveLatency,*int64)

	// QueryLimits represents limits for a query
	// +optional
	queryLimits?: null | #QueryLimits @go(QueryLimits,*QueryLimits)

	// Makes the cluster READ ONLY. This has not a strong guarantee, in case of a failover the cluster will be writable
	// for at least a few seconds.
	// +optional
	readOnly?: bool @go(ReadOnly)

	// Set a custom offset for Server IDs.  ServerID for each node will be the index of the statefulset, plus offset
	// +optional
	serverIDOffset?: null | int @go(ServerIDOffset,*int)

	// BackupCompressCommand is a command to use for compressing the backup.
	// +optional
	backupCompressCommand?: [...string] @go(BackupCompressCommand,[]string)

	// BackupDecompressCommand is a command to use for decompressing the backup.
	// +optional
	backupDecompressCommand?: [...string] @go(BackupDecompressCommand,[]string)

	// MetricsExporterExtraArgs is a list of extra command line arguments to pass to MySQL metrics exporter.
	// See https://github.com/prometheus/mysqld_exporter for the list of available flags.
	// +optional
	metricsExporterExtraArgs?: [...string] @go(MetricsExporterExtraArgs,[]string)

	// RcloneExtraArgs is a list of extra command line arguments to pass to rclone.
	// +optional
	rcloneExtraArgs?: [...string] @go(RcloneExtraArgs,[]string)

	// XbstreamExtraArgs is a list of extra command line arguments to pass to xbstream.
	// +optional
	xbstreamExtraArgs?: [...string] @go(XbstreamExtraArgs,[]string)

	// XtrabackupExtraArgs is a list of extra command line arguments to pass to xtrabackup.
	// +optional
	xtrabackupExtraArgs?: [...string] @go(XtrabackupExtraArgs,[]string)

	// XtrabackupPrepareExtraArgs is a list of extra command line arguments to pass to xtrabackup
	// during --prepare.
	// +optional
	xtrabackupPrepareExtraArgs?: [...string] @go(XtrabackupPrepareExtraArgs,[]string)

	// XtrabackupTargetDir is a backup destination directory for xtrabackup.
	// +optional
	xtrabackupTargetDir?: string @go(XtrabackupTargetDir)

	// InitFileExtraSQL is a list of extra sql commands to append to init_file.
	// +optional
	initFileExtraSQL?: [...string] @go(InitFileExtraSQL,[]string)
}

// MysqlConf defines type for extra cluster configs. It's a simple map between
// string and string.
#MysqlConf: {[string]: intstr.#IntOrString}

// PodSpec defines type for configure cluster pod spec.
#PodSpec: {
	imagePullPolicy?: core.#PullPolicy @go(ImagePullPolicy)
	imagePullSecrets?: [...core.#LocalObjectReference] @go(ImagePullSecrets,[]core.LocalObjectReference)
	labels?: {[string]: string} @go(Labels,map[string]string)
	annotations?: {[string]: string} @go(Annotations,map[string]string)
	resources?:      core.#ResourceRequirements @go(Resources)
	affinity?:       null | core.#Affinity      @go(Affinity,*core.Affinity)
	mysqlLifecycle?: null | core.#Lifecycle     @go(MysqlLifecycle,*core.Lifecycle)
	nodeSelector?: {[string]: string} @go(NodeSelector,map[string]string)
	priorityClassName?: string @go(PriorityClassName)
	tolerations?: [...core.#Toleration] @go(Tolerations,[]core.Toleration)
	serviceAccountName?: string                @go(ServiceAccountName)
	backupAffinity?:     null | core.#Affinity @go(BackupAffinity,*core.Affinity)
	backupNodeSelector?: {[string]: string} @go(BackupNodeSelector,map[string]string)
	backupPriorityClassName?: string @go(BackupPriorityClassName)
	backupTolerations?: [...core.#Toleration] @go(BackupTolerations,[]core.Toleration)

	// Volumes allows adding extra volumes to the statefulset
	// +optional
	volumes?: [...core.#Volume] @go(Volumes,[]core.Volume)

	// VolumesMounts allows mounting extra volumes to the mysql container
	// +optional
	volumeMounts?: [...core.#VolumeMount] @go(VolumeMounts,[]core.VolumeMount)

	// InitContainers allows the user to specify extra init containers
	// +optional
	initContainers?: [...core.#Container] @go(InitContainers,[]core.Container)

	// Containers allows for user to specify extra sidecar containers to run along with mysql
	// +optional
	containers?: [...core.#Container] @go(Containers,[]core.Container)

	// MetricsExporterResources allows you to specify resources for metrics exporter container
	// +optional
	metricsExporterResources?: core.#ResourceRequirements @go(MetricsExporterResources)

	// MySQLOperatorSidecarResources allows you to specify resources for sidecar container
	// used to take backups with xtrabackup
	// +optional
	mysqlOperatorSidecarResources?: core.#ResourceRequirements @go(MySQLOperatorSidecarResources)
}

// VolumeSpec is the desired spec for storing mysql data. Only one of its
// members may be specified.
#VolumeSpec: {
	// EmptyDir to use as data volume for mysql. EmptyDir represents a temporary
	// directory that shares a pod's lifetime.
	// +optional
	emptyDir?: null | core.#EmptyDirVolumeSource @go(EmptyDir,*core.EmptyDirVolumeSource)

	// HostPath to use as data volume for mysql. HostPath represents a
	// pre-existing file or directory on the host machine that is directly
	// exposed to the container.
	// +optional
	hostPath?: null | core.#HostPathVolumeSource @go(HostPath,*core.HostPathVolumeSource)

	// PersistentVolumeClaim to specify PVC spec for the volume for mysql data.
	// It has the highest level of precedence, followed by HostPath and
	// EmptyDir. And represents the PVC specification.
	// +optional
	persistentVolumeClaim?: null | core.#PersistentVolumeClaimSpec @go(PersistentVolumeClaim,*core.PersistentVolumeClaimSpec)
}

// QueryLimits represents the pt-kill parameters, more info can be found
// here: https://www.percona.com/doc/percona-toolkit/LATEST/pt-kill.html
#QueryLimits: {
	// MaxIdleTime match queries that have been idle for longer then this time,
	// in seconds. (--idle-time flag)
	// + optional
	maxIdleTime?: null | int @go(MaxIdleTime,*int)

	// MaxQueryTime match queries that have been running for longer then this
	// time, in seconds. This field is required. (--busy-time flag)
	maxQueryTime: int @go(MaxQueryTime)

	// Kill represents the mode of which the matching queries in each class will
	// be killed, (the --victims flag). Can be one of oldest|all|all-but-oldest.
	// By default, the matching query with the highest Time value is killed (the
	// oldest query.
	// +optional
	kill?: string @go(Kill)

	// KillMode can be: `connection` or `query`, when it's used `connection`
	// means that when a query is matched the connection is killed (using --kill
	// flag) and if it's used `query` means that the query is killed (using
	// --kill-query flag)
	// +optional
	killMode?: string @go(KillMode)

	// IgnoreDb is the list of database that are ignored by pt-kill (--ignore-db
	// flag).
	// +optional
	ignoreDb?: [...string] @go(IgnoreDb,[]string)

	// IgnoreCommands the list of commands to be ignored.
	// +optional
	ignoreCommands?: [...string] @go(IgnoreCommand,[]string)

	// IgnoreUser the list of users to be ignored.
	// +optional
	ignoreUser?: [...string] @go(IgnoreUser,[]string)
}

// ClusterCondition defines type for cluster conditions.
#ClusterCondition: {
	// type of cluster condition, values in (\"Ready\")
	type: #ClusterConditionType @go(Type)

	// Status of the condition, one of (\"True\", \"False\", \"Unknown\")
	status: core.#ConditionStatus @go(Status)

	// LastTransitionTime
	lastTransitionTime: metav1.#Time @go(LastTransitionTime)

	// Reason
	reason: string @go(Reason)

	// Message
	message: string @go(Message)
}

// ClusterConditionType defines type for cluster condition type.
#ClusterConditionType: string // #enumClusterConditionType

#enumClusterConditionType:
	#ClusterConditionReady |
	#ClusterConditionFailoverAck |
	#ClusterConditionReadOnly |
	#ClusterConditionFailoverInProgress

// ClusterConditionReady represents the readiness of the cluster. This
// condition is the same sa statefulset Ready condition.
#ClusterConditionReady: #ClusterConditionType & "Ready"

// ClusterConditionFailoverAck represents if the cluster has pending ack in
// orchestrator or not.
#ClusterConditionFailoverAck: #ClusterConditionType & "PendingFailoverAck"

// ClusterConditionReadOnly describe cluster state if it's in read only or
// writable.
#ClusterConditionReadOnly: #ClusterConditionType & "ReadOnly"

// ClusterConditionFailoverInProgress indicates if there is a current failover in progress
// done by the Orchestrator
#ClusterConditionFailoverInProgress: #ClusterConditionType & "FailoverInProgress"

// NodeStatus defines type for status of a node into cluster.
#NodeStatus: {
	name: string @go(Name)
	conditions?: [...#NodeCondition] @go(Conditions,[]NodeCondition)
}

// NodeCondition defines type for representing node conditions.
#NodeCondition: {
	type:               #NodeConditionType    @go(Type)
	status:             core.#ConditionStatus @go(Status)
	lastTransitionTime: metav1.#Time          @go(LastTransitionTime)
}

// NodeConditionType defines type for node condition type.
#NodeConditionType: string // #enumNodeConditionType

#enumNodeConditionType:
	#NodeConditionLagged |
	#NodeConditionReplicating |
	#NodeConditionMaster |
	#NodeConditionReadOnly

// NodeConditionLagged represents if the node is marked as lagged by
// orchestrator.
#NodeConditionLagged: #NodeConditionType & "Lagged"

// NodeConditionReplicating represents if the node is replicating or not.
#NodeConditionReplicating: #NodeConditionType & "Replicating"

// NodeConditionMaster represents if the node is master or not.
#NodeConditionMaster: #NodeConditionType & "Master"

// NodeConditionReadOnly repesents if the node is read only or not
#NodeConditionReadOnly: #NodeConditionType & "ReadOnly"

// MysqlClusterStatus defines the observed state of MysqlCluster
#MysqlClusterStatus: {
	// ReadyNodes represents number of the nodes that are in ready state
	readyNodes?: int @go(ReadyNodes)

	// Conditions contains the list of the cluster conditions fulfilled
	conditions?: [...#ClusterCondition] @go(Conditions,[]ClusterCondition)

	// Nodes contains informations from orchestrator
	nodes?: [...#NodeStatus] @go(Nodes,[]NodeStatus)
}

// MysqlCluster is the Schema for the mysqlclusters API
// +kubebuilder:object:root=true
// +kubebuilder:subresource:status
// +kubebuilder:subresource:scale:specpath=.spec.replicas,statuspath=.status.readyNodes
// +kubebuilder:printcolumn:name="Ready",type="string",JSONPath=".status.conditions[?(@.type == 'Ready')].status",description="The cluster status"
// +kubebuilder:printcolumn:name="Replicas",type="integer",JSONPath=".spec.replicas",description="The number of desired nodes"
// +kubebuilder:printcolumn:name="Age",type="date",JSONPath=".metadata.creationTimestamp"
// +kubebuilder:resource:shortName=mysql
//
#MysqlCluster: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta  @go(ObjectMeta)
	spec?:     #MysqlClusterSpec   @go(Spec)
	status?:   #MysqlClusterStatus @go(Status)
}

// MysqlClusterList contains a list of MysqlCluster
// +kubebuilder:object:root=true
//
#MysqlClusterList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#MysqlCluster] @go(Items,[]MysqlCluster)
}
