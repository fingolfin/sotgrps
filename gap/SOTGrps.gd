#############################################################################
#! @Chapter The SOTGrps package
#! With some overlaps, the SOTGrps package extends the Small Group Library to give access to some more
#!    "small" orders. For example, it constructs a
#!    complete and irredundant list of isomorphism type representatives of the groups of order
#!    - that factorises into at most four primes;
#!    - p^4q, for disctinct primes p and q.
##

###############################
##
##
##
#! @Section Main functions

#! @Description
#!  takes in a number n that factorises into at most 4 primes or of the form p^4q (p, q are distinct primes),
#!  and complete and duplicate-free list of isomorphism class representatives of the groups of order <A>n</A>.
#!  Solvable groups are using refined polycyclic presentations and then converted into PcGroup using <K>PcpGroupToPcGroup</K>.
#!  If PcpGroups are preferred (for instance, to reduce runtime), set <K>USE_PCP := true</K>, then the groups are given as PcpGroup.
#!  Nonsolvable groups are given as permutation groups.
#! @Arguments n
#! @BeginExampleSession
#! gap> AllSOTGroups(60);
#! [ <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>,
#!  <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>,
#!  <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>, <pc group of size 60 with 4 generators>,
#!  Alt( [ 1 .. 5 ] ) ]

#! gap> USE_PCP := true;;
#! gap> AllSOTGroups(60);
#! [ Pcp-group with orders [ 2, 2, 3, 5 ], Pcp-group with orders [ 2, 2, 3, 5 ], Pcp-group with orders [ 2, 2, 3, 5 ], Pcp-group with orders [ 2, 2, 3, 5 ],
#!  Pcp-group with orders [ 2, 2, 3, 5 ], Pcp-group with orders [ 3, 5, 2, 2 ], Pcp-group with orders [ 2, 2, 5, 3 ], Pcp-group with orders [ 2, 2, 3, 5 ],
#!  Pcp-group with orders [ 2, 2, 3, 5 ], Pcp-group with orders [ 2, 2, 3, 5 ], Pcp-group with orders [ 2, 2, 3, 5 ], Pcp-group with orders [ 2, 2, 3, 5 ],
#!  Alt( [ 1 .. 5 ] ) ]
#! gap> USE_PCP := false;;
#! @EndExampleSession
DeclareGlobalFunction("AllSOTGroups");

#! @Description
#!  returns the <A>i</A>-th group with respect to the ordering of
#!  the list AllSOTGroups(<A>n</A>) without constructing all groups in the list.
#! @Arguments n, i
#! @BeginExampleSession
#! gap> SOTGroup(2*3*5*7, 1);
#! <pc group of size 210 with 4 generators>
#! @EndExampleSession
DeclareGlobalFunction("SOTGroup");

#! @Description
#!  returns the number of isomorphism types of groups of order <A>n</A>.
#! @Arguments n
#! @BeginExampleSession
#! gap> NumberOfSOTGroups(2*3*5*7);
#! 12
#! gap> NumberOfSOTGroups(2*3*5*7*11);
#! Error, Order 2310 is not available: NumberOfSOTGroups(#) returns the number of isomorphism types of groups of order that factorises into at most 4 primes or of the form p^4q.
#! @EndExampleSession
DeclareGlobalFunction("NumberOfSOTGroups");

#! @Description
#!  determines the SOT library number of <A>G</A>;
#!  that is, the function returns a pair [<A>n</A>, <A>i</A>] where <A>G</A> is isomorphic to SOTGroup(<A>n</A>, <A>i</A>).
#! @Arguments G
DeclareAttribute( "IdSOTGroup", IsGroup );

#! @Description
#! determines whether two groups <A>G</A>, <A>H</A> are isomorphic. It is assumed that the input groups are available in the SOTGrps library.
#! @Arguments G, H
DeclareGlobalFunction("IsIsomorphicSOTGroups");

#! @Description
#!  returns <K>true</K> if the order <A>n</A> is available in the SOTGrps library, and <K>false</K> otherwise.
#! @Arguments n
DeclareGlobalFunction("IsSOTAvailable");

#! @Description
#!  prints information on the groups of the specified order.
#!  Since there are some overlaps between the SmallGrps library and the SOTGrps library, for orders that are available
#!  in SmallGrps, SOTGrps constructs the groups in a different order and so generates a different group ID. To minimise confusion, we call these group IDs SOTId.
#! @BeginExampleSession
#! gap> SOTGroupsInformation(2^2*3*19);
#!
#!   There are 15 groups of order 228.
#!
#!   The groups of order p^2qr are either solvable or isomorphic to Alt(5).
#!   The solvable groups are sorted by their Fitting subgroup.
#!      SOT 1 - 2 are the nilpotent groups.
#!      SOT 3 has Fitting subgroup of order 57.
#!      SOT 4 - 7 have Fitting subgroup of order 76.
#!      SOT 8 - 9 have Fitting subgroup of order 38.
#!      SOT 10 - 15 have Fitting subgroup of order 114.
#!
#! @EndExampleSession
#! @Arguments
DeclareGlobalFunction("SOTGroupsInformation");
