
def run( sql )
  begin
    db = PG.connect({ dbname: 'catchpenny', host: 'localhost' })
    result = db.exec( sql )
  ensure
    db.close
  end
  return result
end