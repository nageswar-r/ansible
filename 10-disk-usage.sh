- name: collecting disk usage
  hosts: local
  connection: local
  tasks:
    - name: Run df -h
      shell: df -hT | grep -i tmpfs || true
      register: tmpfs_usage

    - name: Show disk usage
      debug: 
        var: tmpfs_usage.stdout_lines