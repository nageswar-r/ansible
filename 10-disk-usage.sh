- name: collecting disk usage
  hosts: local
  connection: local
  tasks:
    - name: Run df -h
      command: df -hT| grep -i nfs
      register: disk_usage
    - name: Show disk usage
      debug: 
        var: disk_usage.stdout_lines