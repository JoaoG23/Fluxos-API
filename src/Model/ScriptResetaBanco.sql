
delete from tb_elementos where idelementos > 1;
delete from tb_fluxocaixa where id_item_fluxo > 1;
delete from tb_minitipos where id_minitipos > 1;
delete from tb_nanotipos where id_nanotipos > 1;
delete from tb_subelementos where idsubelementos > 1;
delete from tb_subtipos where idsubtipos > 1;
delete from tb_tipos where id_tipos > 1;

ALTER TABLE tb_elementos AUTO_INCREMENT = 2;
ALTER TABLE tb_fluxocaixa AUTO_INCREMENT = 2;
ALTER TABLE tb_minitipos AUTO_INCREMENT = 2;
ALTER TABLE tb_nanotipos AUTO_INCREMENT = 2;
ALTER TABLE tb_subelementos AUTO_INCREMENT = 2;
ALTER TABLE tb_subtipos AUTO_INCREMENT = 2;
ALTER TABLE tb_tipos AUTO_INCREMENT = 2;

