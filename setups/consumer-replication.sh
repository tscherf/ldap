# start an online initialization of the consumer

ldapmodify -D "cn=directory manager" -w secret -p 389 -h supplier1.example.com \
 dn: cn=ExampleAgreement,cn=replica,cn="dc=example,dc=com",cn=mapping tree,cn=config \
 changetype: modify
 replace: nsds5beginreplicarefresh
 nsds5beginreplicarefresh: start


# check the status of replication 
# nsds5BeginReplicaRefresh - only available while refreshing
# nsds5ReplicaLastInitStatus - shows the status

ldapsearch -h hostname -p port -D "cn=directory manager" -w secret \
 -s base -b 'cn=ExampleAgreement,cn="dc=example,dc=com", cn=mapping tree, \
 cn=config' '(objectclass=*)'

