 Admission controllers are a key security feature in Kubernetes that **intercept and validate or mutate requests to the Kubernetes API server** before the object is persisted. 🛡️ Think of them as **gatekeepers** or a **bouncer at a club**. They check if a request to create, update, or delete a resource (like a Pod or a Deployment) is allowed to proceed, and can even change the resource definition on the fly.

***

## How Admission Controllers Work

When you interact with Kubernetes—for example, by running `kubectl apply -f my-pod.yaml`—the request goes through a series of steps:

1.  **Authentication:** Kubernetes first verifies your identity.
2.  **Authorization:** It then checks if you have permission to perform the requested action.
3.  **Admission Control:** This is where the admission controllers step in. The request is passed through a **chain of controllers** configured by the cluster administrator. Each controller examines the request and decides whether to accept it, reject it, or modify it. If any controller rejects the request, the entire process stops, and you get an error message.
4.  **Resource Persistence:** If the request passes all admission controllers, the object (e.g., the Pod) is then saved to the etcd data store.



***

## Types of Admission Controllers

There are two main types of admission controllers:

* **Validating Admission Controllers:** These are like a **security guard** who only allows people in if they meet a specific set of rules. They **only check requests** and can **reject them** if they don't comply. For example, a validating controller might reject a request to create a Pod if it doesn't have a specific label or if it tries to use a forbidden image.

* **Mutating Admission Controllers:** These are like a **concierge** who not only checks you in but also gives you a welcome kit. They can **modify the request** before it's saved. For instance, a mutating controller might automatically add sidecar containers, labels, or annotations to a Pod definition, even if you didn't include them in your original YAML file.

***

## Common Use Cases

Admission controllers are incredibly powerful and are used for a variety of purposes, including:

* **Enforcing Security Policies:** Ensuring all Pods run as non-root users or use specific security contexts.
* **Cost Management:** Rejecting Pods that don't have resource limits set to prevent them from consuming too many cluster resources.
* **Compliance:** Automatically adding company-mandated labels to resources for tracking and governance.
* **Operational Consistency:** Injecting specific sidecar containers for logging or monitoring into every Pod.

In short, they are a powerful, proactive way to **enforce policies across your entire cluster**, preventing misconfigurations and enhancing security before a resource ever gets created.
