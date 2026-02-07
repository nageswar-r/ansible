- name: collecting disk usage
  hosts: local
  connection: local
  tasks:
    - name: Run df -h
      command: df -h
      register: disk_usage
    - name: Show disk usage
      dedug: 
        var: disk_usage.stdout_lines