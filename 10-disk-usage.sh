- name: collecting disk usage
  hosts: local,web
  become: yes
  tasks:
    - name: Run df -h
      shell: df -hT | grep -i tmpfs || true
      register: tmpfs_usage

    - name: Show disk usage
      debug: 
        # msg: "{{ inventory_hostname }}:\n{{ tmpfs_usage.stdout | default('No tmpfs mounts found') }}"
        var: tmpfs_usage.stdout_lines
  tasks:
    - name: Check if nginx is installed
      command: nginx -v
      register: nginx_check
      ignore_errors: yes
    - name: Install nginx if not present
      yum:
        name: nginx
        state: present
      when: nginx_check.rc != 0
      tags: install
    - name: Ensure nginx service is running
      service:
        name: nginx
        state: started
        enabled: yes