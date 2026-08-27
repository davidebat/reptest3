module pippo
implicit none

contains

elemental function t1(a, b) result(fout)
real , intent(in) :: a, b
real              :: fout

call writeout( 'START t1, t2', 0)

fout = a+b

end function t1

!----------------------------------------------------------!
subroutine writeout2

write(*,*) 'ciao writeout2'

end subroutine writeout2

!----------------------------------------------------------!

subroutine writeout(str,unit)
character(len=*), intent(in) :: str
integer,          intent(in) :: unit

if(unit>0)then
   write(unit,*) str
else
   write(*,*) str
endif
write(*,*) 'pippo'
end subroutine writeout

end module pippo

!----------------------------------------------------------!
!----------------------------------------------------------!

program tdriver
use pippo
real :: aa(2), bb, cc(2)

write(*,*) 'hello tdriver'

aa = [1., 3.]
bb = 2.

cc = t1(aa, bb)

write(*,*) '...cc :', cc


write(*,*) 'END   tdriver'

end program tdriver

