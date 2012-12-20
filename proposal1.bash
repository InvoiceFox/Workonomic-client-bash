# first proposal
# ==============
#
#
# state: collecting feedback, brainstorming

# first level retrieval

$ wrk proj list
$ wrk proj get 10
$ wrk proj get <shortname>

$ wrk work list
$ wrk work get 100

# second level retrieval (option 1 - structured)

$ wrk proj get 10 work list
$ wrk work get 100 notes list

# second level retrieval (option 2 - flatter)

$ wrk work list of-proj 10
$ wrk notes list of-work 100

# second level retrieval (option 3 - flatter)

$ wrk work list --proj 10
$ wrk notes list --work 100

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


# weird ideas: internal stack
# ===========================

# wrk command has internal persistent stack (forth style??)
# this creates sort of internal language capability that can be more natural 
# workflow-vise and simpler to type/look than traditional bash utlis. Especially
# in multistep occasions

$ wrk project get <shortname> :push
$ wrk list work of-proj :pop

$ wrk client find-one <part-of-name> :push
$ wrk proj create <short> <name> :pop

# in both these examples xargs or other shell methods could be used but it would be more complex,
# you wouldn't see the output simply and push it and I see needs for multiple values

$ wrk proj list
$ wrk -id proj get <short1> :push
$ wrk :dup # duplicates top value on stack
$ wrk -id work get-at-date :pop <date1> :push
$ wrk :switch # switches the top values
$ wrk -id work get-at-date :pop <date2> :push
$ wrk charge create :pop :pop 50 :push # use
$ wrk charge get-invoice :pop # id of charge
$ wrk :unpop # we looked at the invoice PDF and decided to send it.. we need the id again
$ wrk charge send-invoice :pop jimbo@elephant.cc

## weird idea inside the stack lang .. unpop (sort of undo) so you don't have to dup in advance
## works better in interactive use because you don't have to always calcualte your steps ahead !!!
## hm.. this looks awesome to me right now !



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
