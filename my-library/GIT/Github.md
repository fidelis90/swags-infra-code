REPOSITORY 
 - This is a project 
 - it houses all the codes and informations used to create a project(app)

 - README.md
   - md: means markdown language 
   - the file that describes the project/repo 
   - # for the heading
   - ## for subheader  

AUTHENTICATION 
  - SSH-KEYS 
    - create ssh key locally 
      - ssh-keygen -t rsa -b 4096 -C "email@example.com"
    - we need the local git cli to know about the key that's just generated 
      - start the ssh-agent in the background 
        - eval "$(ssh-agent -s)"
        - open ~/.ssh/config
        - Host *
            AddKeysToAgent yes
            IdentityFile ~/.ssh/id_rsa
        -  ssh-add -K ~/.ssh/id_rsa 
      
