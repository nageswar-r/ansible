- name: collecting disk usage
  hosts: local
  connection: local
  tasks:
    - name: Run df -h
      shell: df -hT | grep -i tmpfs || true
      register: tmpfs_usage

    - name: Show disk usage
      debug: 
        # msg: "{{ inventory_hostname }}:\n{{ tmpfs_usage.stdout | default('No tmpfs mounts found') }}"
        var: tmpfs_usage.stdout_lines