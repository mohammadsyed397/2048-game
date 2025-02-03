# 2048 Game on Azure Kubernetes Service (AKS)

This repository contains the Terraform configuration and Kubernetes deployment manifest to deploy the **2048 Game** on **Azure Kubernetes Service (AKS)**.

## Prerequisites

Before you start, ensure that you have the following tools installed on your machine:

- **Azure Account**: [Create an account](https://azure.microsoft.com/en-us/free/) if you don’t have one.
- **Terraform**: [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- **Azure CLI**: [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).
- **kubectl**: [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
- **Git**: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

---

## Steps to Deploy the 2048 Game on AKS

Follow these steps to deploy the 2048 Game on Azure Kubernetes Service (AKS) using Terraform and Kubernetes:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/mohammadsyed397/2048-game.git
    cd 2048-game
    ```

2. **Initialize Terraform**:

    Initialize Terraform to download the required provider plugins and set up the working directory:

    ```bash
    terraform init
    ```

3. **Create AKS Cluster**:

    Use Terraform to create the Azure Kubernetes Service (AKS) cluster and its associated resources:

    ```bash
    terraform apply
    ```

    - Terraform will prompt you for confirmation before applying. Type `yes` and press Enter to proceed with the creation of the AKS cluster.

4. **Verify the AKS Cluster**:

    After the AKS cluster is created, verify that the nodes are running:

    ```bash
    kubectl get nodes
    ```

    This command will display the list of nodes in your AKS cluster.

5. **Deploy the 2048 Game on Kubernetes**:

    Deploy the 2048 Game using the provided `deployment.yaml` manifest:

    ```bash
    kubectl apply -f deployment.yaml
    ```

6. **Access the 2048 Game**:

    To access the 2048 game, retrieve the external IP address and port number by running the following command:

    ```bash
    kubectl get svc
    ```

    This command will output something like:

    ```
    EXTERNAL-IP     PORT(S)          AGE
    <External-IP>   8000:32393/TCP   1m
    ```

    Once you have the external IP address, open your browser and navigate to:

    ```text
    http://<External-IP>:8000
    ```

    You should now be able to play the 2048 game!

7. **Cleanup (Optional)**:

    To delete the resources created by Terraform, including the AKS cluster, run:

    ```bash
    terraform destroy
    ```

    Terraform will prompt you for confirmation before destroying the resources. Type `yes` to proceed with the destruction of the resources.


