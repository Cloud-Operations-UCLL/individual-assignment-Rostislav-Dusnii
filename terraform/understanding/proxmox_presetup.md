# Creating the Proxmox User and Role for Terraform

To configure Terraform with Proxmox, you need to create a dedicated user and role. While the required privileges may vary, the following steps provide a good starting point without granting cluster-wide Administrator rights.

## Steps

1. **Log into the Proxmox cluster or host**  
    Use SSH or perform these steps via the GUI.

2. **Create a new role for the Terraform user**  
    Run the following command to define the role with the necessary privileges:
    ```bash
    pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
    ```

    the problem can be 
    ```
    400 Parameter verification failed.
    privs: invalid format - invalid privilege 'VM.Monitor'

    pveum role add <roleid> [OPTIONS]
    ```

3. **Create the user `terraform-prov@pve`**  
    Replace `<password>` with a secure password:
    ```bash
    pveum user add terraform-prov@pve --password <password>
    ```

4. **Assign the role to the user**  
    Grant the `TerraformProv` role to the `terraform-prov@pve` user:
    ```bash
    pveum aclmod / -user terraform-prov@pve -role TerraformProv
    ```

## Note

The Terraform provider also supports using an API key instead of a password. Refer to the documentation below for more details.