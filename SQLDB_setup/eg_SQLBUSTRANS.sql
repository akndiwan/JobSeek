         SELECT *
         FROM Position P, Company C
         WHERE P.pID=S.pID AND positionName=’Data Analyst’;
 
         SELECT *
         FROM Position p, Location l, Company c
         WHERE p.locID=l.locID AND p.cID=c.cID AND Type=’Internship’;

         SELECT *
         FROM Position p, Location l, Company c
         WHERE p.locID=l.locID AND p.cID=c.cID AND cName=’Amazon’;

         SELECT *
         FROM Position p, Location l, Company c
         WHERE p.locID=l.locID AND p.cID=c.cID AND workAuthReq = ‘Citizen’;

         SELECT * FROM University u , Student s 
          WHERE s.uID=u.uID" AND uName=’University of Maryland’;
