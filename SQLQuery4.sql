-- �ٸ� DB���� �����͸� �������� ���� ��

select top 5 * from ����

select top 1 percent * from ���� 

select top 5 percent with ties * from ���� -- with ties / �ߺ� ����
-- with ties�� order by �� �Բ� �;���. �ֳ�? �ϴ� ������ ������ ���� ��������� �װ� �� �����ؾ���

select top 5 percent with ties  * from ���� order by ���� -- with ties / �ߺ� ����

set rowcount 1  -- ���� ������� �ִ� 1�ٱ�����select top 5 * from ����
set rowcount 5select top 5 * from ����

--  �� ����

set rowcount 0 -- �ʱ�ȭ

select �̸�, ����
from ����
where ���� >= 90

-- https://injun379.tistory.com/113

-- ���ڿ� �񱳿� ���ϵ�ī��

-- like, not like

select �̸�, ����
from ����
where �̸� like '��%'

/* ���衯���� �����ϴ� ���� �˻� (��Ȯ�� �˻��� �ƴ϶�
�κи�Ī�ϴ� ���̹Ƿ� like �� ���)*/-- _ / book_ = book+@(char) / books, booka, booky-- % / book% = book+@ / book, books, booker, bookanistan-- % / %book% = includes book / timbooker, timbooksttaks-- [] / [bo]ing = ������ b/o�� �����ؼ� ing�� ������ ���� / boring, booking, bookmaxxing....-- [] / [b-f]ing = b~f������ ���� ���ڰ� front / bing_chilling, ding, eing, fing-- [^] / M[^c]% = [^]���� ���� ���� / Mike/Many/Mickeyselect * from ����where �̸� like '��%[����]'-- ����2set rowcount 0select top 3 with ties * from ���� order by ���� -- ���������̴� ���� ������ ���� ���ٴ� ���!!!select �й�, �̸�, ���� from �л���where ���� >= 90select �̸�, ���̸� from �л��� where ���̸� like'[A-Z]%'select �й�, �̸� + '(' + ���� + ')'
 as [�̸�(����)]
from ����

-- �й� , �̸�+���� �����͸� �����ͼ� �̸�(����)�� ǥ�� �̸��� �����´�

-- and, or, not

-- between a and b // a,b ���� ���� ��
-- and �����ڷ� ���氡�� (�׷��� ���� >= A and ���� <= B ���� �޸𸮸� 2�� �Դ´�)
-- Not between a and b // a,b���� ���� ��
-- or �����ڷ� ���氡��

-- between 75 and 85 // 75. 76. 77....
-- Not between 75 and 85, // 1, 2, 3.... 74, 86, 87....

-- in

select * from ����
 where �̸� in ('������', '���߱�', '�̿���')

select * from ����
 where �̸� not in ('������', '���߱�', '�̿���')

select * from ����
where �̸� != '������' and �̸� != '���߱�' and �̸� != '�̿���'


-- ����3

select * from �л��� where ���̸� = '���ѵ���' and  ���� >= 80

select * from �л��� where ���� between 80 and 90

select * from �л��� where ���̸� = 'BIG' or ���̸� = '����Ʈ' --order by ���̸�


SELECT �̸�, ����+3 as '3���߰�' from ���� -- �� �����ʹ� �ǵ帮�� �ʰ� 3�� �߰� �ؼ� ��������


-- null
-- SQL������ unidentified ������ ���µ�

select * from ��ǰ where ���� is not null



-- ���� 4

-- select ��ǰ��ȣ, ��ǰ��, ���� from ��ǰ where ���� is not null
select ��ǰ��ȣ, ��ǰ��, floor(����*1.1) as '������' from ��ǰ where ���� is not null 
order by ������ desc

