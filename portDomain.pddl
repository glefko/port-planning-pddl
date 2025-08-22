(define (domain portDomain)
	(:requirements :strips)
	(:predicates
		(crane ?x) (dock ?x) (container ?x)
		(at ?crane ?dock) (located ?container ?dock) (loaded ?crane ?container)
		(free ?crane) (clear ?container) (on ?container1 ?container2) (ondock ?container)
		(road ?dock1 ?dock2)
	)
	(:action Stack
		:parameters ( ?A ?B ?C ?D )
		:precondition (and (container ?A) (container ?B) (crane ?C) (dock ?D) (clear ?A) (clear ?B) (ondock ?A) (located ?A ?D) (located ?B ?D) (at ?C ?D))
		:effect (and (on ?A ?B) (not (clear ?B)) (not (ondock ?A)))
	)
	(:action Unstack
		:parameters ( ?A ?B ?C ?D )
		:precondition (and (container ?A) (container ?B) (clear ?A) (on ?A ?B) (located ?A ?D) (located ?B ?D) (at ?C ?D))
		:effect (and (clear ?B) (ondock ?A) (not (on ?A ?B)))
	)
	(:action ChangeStack
		:parameters ( ?A ?B ?C ?D ?E )
		:precondition (and (container ?A) (container ?B) (container ?C) (crane ?D) (dock ?E) (on ?A ?B) (clear ?A) (clear ?C) (located ?A ?E) (located ?B ?E) (located ?C ?E) (at ?D ?E))
		:effect (and (on ?A ?C) (clear ?B) (not (on ?A ?B)) (not (clear ?C)))
	)
	(:action LoadFromDock
		:parameters ( ?A ?B ?C )
		:precondition (and (container ?A) (crane ?B) (dock ?C) (at ?B ?C) (clear ?A) (free ?B) (located ?A ?C) (ondock ?A))
		:effect (and (loaded ?B ?A) (not (free ?B)) (not (ondock ?A)) (not (located ?A ?C)))
	)
	(:action LoadFromStack
		:parameters ( ?A ?B ?C ?D )
		:precondition (and (container ?A) (container ?B) (crane ?C) (dock ?D) (at ?C ?D) (clear ?A) (free ?C) (located ?A ?D) (located ?B ?D) (on ?A ?B))
		:effect (and (loaded ?C ?A) (clear ?B) (not (free ?C)) (not (on ?A ?B)) (not (located ?A ?D)))
	)
	(:action UnloadToDock
		:parameters ( ?A ?B ?C )
		:precondition (and (crane ?A) (container ?B) (dock ?C) (loaded ?A ?B) (at ?A ?C))
		:effect (and (ondock ?B) (located ?B ?C) (free ?A) (not (loaded ?A ?B)))
	)
	(:action UnloadToStock
		:parameters ( ?A ?B ?C ?D )
		:precondition (and (crane ?A) (container ?B) (container ?C) (dock ?D) (loaded ?A ?B) (at ?A ?D) (clear ?C) (located ?C ?D))
		:effect (and (on ?B ?C) (located ?B ?D) (free ?A) (not (loaded ?A ?B)) (not (clear ?C)))
	)	
	(:action Goto
		:parameters ( ?A ?B ?C )
		:precondition (and (crane ?A) (dock ?B) (dock ?C) (at ?A ?B) (road ?B ?C))
		:effect (and (at ?A ?C) (not (at ?A ?B)))
	)
)