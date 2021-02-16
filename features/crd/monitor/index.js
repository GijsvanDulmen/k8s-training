const k8s = require('@kubernetes/client-node');

// setup kubernetes
const kubeConfig = new k8s.KubeConfig();

// check if inside of cluster
if ( process.env.KUBERNETES_SERVICE_HOST ) {
    kubeConfig.loadFromCluster();
} else {
    kubeConfig.loadFromDefault();
}

const watcher = new k8s.Watch(kubeConfig);

watcher.watch('/apis/k8s.training.io/v1alpha1/attendees', {}, (phase, obj) => {
    console.log(phase);
    console.log(obj);
}, (err) => {
    console.log(err);
});