# first proposal B
# ================
# the OO like [ obj.obj.method(args) ] order
#
# state: collecting feedback, brainstorming, focusing on the first part of proposal1
#
# conventions: 
#   * <something> represents some argument, for example <id> would in practice mean
#     you put numeric id there (like 10). <shortname> a string shortname (like proj1)
#   * P> is command written as it would be seen in python
#
#

# simple commands
# ---------------
#
# data retrieval

$ wrk project list
$ wrk project get 10
$ wrk project get proj1
$ wrk project get <id|shortname>

$ wrk work list
$ wrk work get 100
$ wrk work get <id>

P> wrk.work.get(<id>)

# creating records

$ wrk project create <shortname>
$ wrk project create <shortname> <name> <client-id>

P> wrk.project.create(<shortname>, <name>) # method with first required and the rest optional args

# updating records

$ wrk project update <id> <shortname>
$ wrk project update <id> <shortname> <name> <client-id>


# deleting records

$ wrk note delete <id>
$ wrk client delete <id|shortname>

P> wrk.project.delete(id|<shortname>) # method accepts to types of first arg and dispatches on that


## which dissects to ##

wrk - wrapper for all workonomic commands (like git)

project|work|client|note - defines resource you are working with

list|get|create|update|delete - method you are calling

10|<id>|<shortname>|<..> - arguments of method



# commands on 2. level
# --------------------
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

$ wrk work list --proj 10
$ wrk work list --day 2012-12-26
$ wrk notes list --work 100
$ wrk notes list --latest

# retrieval (option 3)

$ wrk work list --proj 10
$ wrk work list --day 2012-12-26
$ wrk notes list --work 100
$ wrk notes list --latest

# retrieval (option 4 - no "refinements concept", just separate methods)

$ wrk work list-by-proj 10
$ wrk work list-by-day 2012-12-26
$ wrk notes list-by-work 100
$ wrk notes list-latest

# retrieval (option 5 - has refinement filter which (also) accepts (multiple) filters
#   you can also look at it as optional named argument of the method "list")

$ wrk work list --filter proj 10
$ wrk work list --filter day 2012-12-26
$ wrk notes list --filter work 100
$ wrk notes list --filter latest 10 #here number could be optional

$ wrk work list --filter proj 10 day 2012-12-01 
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


# if I write few examples as python (P>) or rebol (R>) besides bash (B$)

B$ wrk work list --day 2012-12-26
P> wrk.work.list(day="2012-12-26")
R> wrk/work/list/day 2012-12-26

B$ wrk work list --filter proj 10 day 2012-12-01
P> wrk.work.list(filter={proj: 10, day: "2012-12-01"})
R> wrk/work/list/filter [ proj 10 day 2012-12-01 ]


# Thanks
# ======
#
# Simon B.
#

# Ideas
# =====
# * autodetect input format
# * "using" command to preset certain values

#
# contact
# =======
#
# contact me directly to janko.itm@gmail.com if you have any feedback, proposals or ideas !
