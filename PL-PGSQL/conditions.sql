if v_user_id <> 0 then
    update membro 
    set email = v_user_email
    where id = v_user_id
end if;

if v_count > 0 then
    insert into user_count (count)
        values(v_count);
    return 't';
else
    return 'f'
end if;

