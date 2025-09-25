## **Amazon EKS Auto Mode: Cost-Efficient Scaling Demonstration**

This guide provides a step-by-step practical demonstration of how to provision an Amazon EKS cluster in **Auto Mode** and showcase its automatic scaling and cost-efficiency using Karpenter.

-----

### **Part 1: AWS Console Setup**

1.  Log in to the **AWS Console** and navigate to the **Elastic Kubernetes Service (EKS)**.
2.  Click on **`Create cluster`** and select the **`Quick configuration`** tab.
3.  Choose **`Auto Mode`** for your compute configuration. EKS Auto Mode handles all infrastructure management, including provisioning, scaling, and patching.
4.  **Create IAM Roles**: If you don't have them already, click the links to create the necessary IAM roles for the Cluster and Nodes. This is a one-time activity.
5.  **Finish Creation**: After selecting the roles, give your cluster a name and click **`Create`**. The process will take a few minutes.

-----

### **Part 2: Local Environment Setup**

You'll need three tools on your computer: **AWS CLI**, **`kubectl`**, and **Helm**. If you have not installed them, follow the instructions below.

1.  **Install the AWS CLI**: Use the official installer for your operating system.
2.  **Configure the AWS CLI**: Open your terminal and run `aws configure`. Enter your AWS Access Key ID, Secret Access Key, and your preferred region (e.g., `us-west-2`).
3.  **Install `kubectl`**: Use a package manager like Homebrew on macOS (`brew install kubectl`) or Chocolatey on Windows (`choco install kubernetes-cli`).
4.  **Install Helm**: Use a package manager like Homebrew on macOS (`brew install helm`) or Chocolatey on Windows (`choco install kubernetes-helm`).

-----

### **Part 3: The Demonstration**

1.  **Connect to Your Cluster**: Once the cluster is `Active` in the AWS console, run the following command in your terminal. Replace the placeholders with your cluster name and region.
    ```bash
    aws eks update-kubeconfig --name <your-cluster-name> --region <your-region>
    ```
2.  **Deploy the Application**: We'll use the OpenTelemetry Demo, which is a complex application that will force the cluster to scale.
      * First, add the Helm chart repository:
        ```bash
        helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
        ```
      * Then, install the application:
        ```bash
        helm install my-otel-demo open-telemetry/opentelemetry-demo
        ```
3.  **Observe Automatic Scaling**: Run `kubectl get pods -w` to watch as the pods are deployed. You will see many pods in a **`Pending`** state. In the AWS console, you'll see EKS Auto Mode, powered by **Karpenter**, automatically provisioning new nodes to handle this demand.
4.  **Demonstrate Cost-Efficiency**: To see the cluster scale down, simply uninstall the application.
    ```bash
    helm uninstall my-otel-demo
    ```
    Karpenter will detect that the nodes are no longer needed and will automatically terminate them, saving you from paying for unused compute resources.

-----

### **Part 4: Cleaning Up**

1.  **Delete the Cluster**: Navigate back to your EKS cluster in the AWS console and click the **`Delete`** button. Confirm the cluster's name.
2.  **Delete IAM Roles**: Go to the IAM console and delete the cluster and node roles you created earlier.

<br>
Now that you have the complete `README.md` file, would you like me to walk you through the final steps to clean up all the resources you&#39;ve created to avoid any unnecessary costs?
