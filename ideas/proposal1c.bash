# first proposal C
# ================
# the (function object args..) lisp like order
#
# state: collecting feedback, brainstorming
#
# conventions: 
#   * <something> represents some argument, for example <id> would in practice mean
#     you put numeric id there (like 10). <shortname> a string shortname (like proj1)
#   * P> is command written as it would be seen in python


# simple commands
# ---------------
#
# data retrieval

$ wrk list projects
$ wrk get project 10
$ wrk get project proj1
$ wrk get project <id|shortname>

$ wrk list work
$ wrk get work 100
$ wrk get work <id>

P> wrk.get('work', <id>)

# creating records

$ wrk create project <shortname>
$ wrk create project <shortname> <name> <client-id>

P> wrk.create('project', <shortname>, <name>) # method with first required and the rest optional params

# updating records

$ wrk update project <id> <shortname>
$ wrk update project <id> <shortname> <name> <client-id>


# deleting records

$ wrk delete note <id>
$ wrk delete client <id|shortname>

P> wrk.delete('project', <id|shortname>) # method accepts to types of first arg and dispatches on that


## which dissects to ##

wrk - wrapper for all workonomic commands (like git)

list|get|create|update|delete - method you are calling

project|work|client|note - defines resource you are working with

10|<id>|<shortname>|<..> - arguments of method



# 2. level commands
# -----------------
#
# maybe we shouldn't look at it as 2. level, but basically "with refinements / filters"
# in examples so far. Basically the method has refinements in Rebol sense.

# retrieval (option 1 - structured)
# dumped on second look, too confusing
#$ wrk project get 10 work list
#$ wrk work get 100 notes list

# retrieval (option 2)

$ wrk work list of-proj 10
$ wrk work list of-day 2012-12-26
$ wrk notes list of-work 100
$ wrk notes list latest

# retrieval (option 3)

$ wrk list work --proj 10
$ wrk list work --day 2012-12-26
$ wrk list notes --work 100
$ wrk list notes --latest

# retrieval (option 3)

$ wrk list work --proj 10
$ wrk list work --day 2012-12-26
$ wrk list notes --work 100
$ wrk list notes --latest

# retrieval (option 4 - no "refinements concept", just separate methods)

## makes less sense here, and I didn't rerriously consider it

#$ wrk work list-by-proj 10
#$ wrk work list-by-day 2012-12-26
#$ wrk notes list-by-work 100
#$ wrk notes list-latest

# retrieval (option 5 - has refinement filter which (also) accepts (multiple) filters
#   you can also look at it as optional named argument of the method "list")

## little more unclear here as filger is next to resource not method

$ wrk list work --filter proj 10
$ wrk list work --filter day 2012-12-26
$ wrk list notes --filter work 100
$ wrk list notes -- filter latest 10 #here number could be optional

$ wrk list list --filter proj 10 day 2012-12-01 
# meaning: call list method on work resource with filter by project and date
# meaning2: get me list of work for project 10 on date 2012-12-01
# would need separator if anything can be defined after filter, mutt has --




## which dissects to ##

wrk - wrapper for all workonomic commands (like git)

project|work|client|note - resource you are working with

list - method you are calling

of-proj|of-work|--proj|--work - modifyer / refinement on the method. In this case filter
--filter - refinement / optional named argument of the method

10|100|<project-id>|<work-id> - arguments (numeric) for the method


# if I write few examples as python (P>) or rebol (R>) besides bash (B>)

B$ wrk list work --day 2012-12-26
P> wrk.list('work', day="2012-12-26")
R> wrk/list/day 'work 2012-12-26                                           ;'

B$ wrk list work --filter proj 10 day 2012-12-01
P> wrk.list('work', filter={proj: 10, day: "2012-12-01"})
R> wrk/list/filter 'work [ proj 10 day 2012-12-01 ]                        ;'

# Notice
# ======
#
# we would make resources work in singular and plurar forms here


# Thanks
# ======
#
# Simon B.
#

#
# contact
# =======
#
# contact me directly to janko.itm@gmail.com if you have any feedback, proposals or ideas !
