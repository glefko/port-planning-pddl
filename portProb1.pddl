(define (problem portProb1)
    (:domain portDomain)
    (:objects
        r1 d1 d2 d3 c1 c2 c3
	)
    (:init
		(crane r1)
		(dock d1)		(dock d2)		(dock d3)
		(container c1) (container c2) (container c3)
		(at r1 d2)
		(located c1 d1) (located c2 d2) (located c3 d1)
		(on c3 c1) (ondock c1) (ondock c2)
		(free r1) (clear c2) (clear c3)
		(road d1 d3) (road d3 d1) (road d1 d2) (road d2 d1)
	)
    (:goal  
		(and
			(at r1 d1)
			(located c1 d3) (located c2 d3) (located c3 d3)
			(ondock c2) (ondock c3) (on c1 c2)
		)
    )
)
