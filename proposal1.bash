# first proposal
# ==============
#
#
# state: collecting feedback, brainstorming

# first level retrieval

$ wrk proj list
$ wrk proj get 10

$ wrk work list
$ wrk work get 100

# second level retrieval (option 1 - structured)

$ wrk proj get 10 work list
$ wrk work get 100 notes list

# second level retrieval (option 2 - flatter)

$ wrk work list of-proj 10
$ wrk notes list of-work 100

# creating records

$ wrk proj create <shortname>
$ wrk proj create <shortname> <name> <client-id>

# updating records

$ wrk proj update <id> <shortname>
$ wrk proj create <id> <shortname> <name> <client-id>

# output formats

$ wrk -f=csv proj list  #output format

# input props pipe

$ cat > props
shortname: <...>
name: <...>

$ cat props | wrk -i=prop proj create -

$ cat props | wrk -i=prop proj update <id> -

# data format symetry .. tsv for input and output ; example of changing and duplicating a project

$ wrk -f=tsv proj get <shortname> | perl -pe 's|bla|blu|' | wrk -i=tsv proj create - 

# working with other unix tools ; example of retrieving and summing hours

$ wrk --justid proj get <shortname> | xargs wrk -f=tsv work of-proj | awk -F"\t" '{sum+=$3}END{print "sum is:", sum}'


# resources
# =========
#
# project - proj
# work - work
# client - client
# charge - charge

# contact
# =======
#
# contact me directly to janko.itm@gmail.com if you have any feedback, proposals or ideas !
