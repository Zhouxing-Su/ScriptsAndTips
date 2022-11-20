select 
  jsrq as 时间, 
  d.chat_identifier as 号码, 
  text as 内容, 
  c.is_from_me as 发送 
from 
  (
    select 
      a.[text], -- 加方括号避免列名与关键字冲突导致的语法错误
      datetime(substr(a.[date], 1, 9) + 978307200, 'unixepoch', 'localtime') as jsrq, 
      rowid, 
      chat_id, 
      is_from_me 
    from 
      message a 
      left join chat_message_join b on a.rowid = b.message_id
  ) c 
  left join chat d on c.chat_id = d.rowid 
order by 
  jsrq desc