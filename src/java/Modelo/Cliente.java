/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.awt.Image;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import util.BancodeDados;

/**
 *
 * @author João Victor Pereira Miranda
 */
public class Cliente {

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the idusuario
     */
    public int getIdusuario() {
        return idusuario;
    }

    /**
     * @param idusuario the idusuario to set
     */
    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the tpRequerente
     */
    public String getTpRequerente() {
        return tpRequerente;
    }

    /**
     * @param tpRequerente the tpRequerente to set
     */
    public void setTpRequerente(String tpRequerente) {
        this.tpRequerente = tpRequerente;
    }

    /**
     * @return the documento
     */
    public String getDocumento() {
        return documento;
    }

    /**
     * @param documento the documento to set
     */
    public void setDocumento(String documento) {
        this.documento = documento;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the ddd
     */
    public String getDdd() {
        return ddd;
    }

    /**
     * @param ddd the ddd to set
     */
    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the logradouro
     */
    public String getLogradouro() {
        return logradouro;
    }

    /**
     * @param logradouro the logradouro to set
     */
    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    /**
     * @return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(String numero) {
        this.numero = numero;
    }

    /**
     * @return the complemento
     */
    public String getComplemento() {
        return complemento;
    }

    /**
     * @param complemento the complemento to set
     */
    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    /**
     * @return the bairro
     */
    public String getBairro() {
        return bairro;
    }

    /**
     * @param bairro the bairro to set
     */
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }

    /**
     * @return the imagem
     */
    public String getImagem() {
        return imagem;
    }

    /**
     * @param imagem the imagem to set
     */
    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    /**
     * @return the dataCadastro
     */
    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    /**
     * @param dataCadastro the dataCadastro to set
     */
    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    private int id;
    private int idusuario;
    private String nome;
    private String tpRequerente;
    private String documento;
    private String email;
    private String ddd;
    private String telefone;
    private String logradouro;
    private String numero;
    private String complemento;
    private String bairro;
    private String cidade;
    private String uf;
    private String imagem;
    private Timestamp dataCadastro;

    public boolean Cadastrar() {
        try {

            Connection conn = BancodeDados.getConexao();
            String sql = "INSERT INTO `bdecoleta`.`tb_ponto` "
                    + "(idusuario, tprequerente, nome, documento, ddd, "
                    + "telefone, email, logradouro, numero, complemento, "
                    + "bairro, cidade, uf, imagem)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, this.getIdusuario());
            ps.setString(2, this.getTpRequerente());
            ps.setString(3, this.getNome());
            ps.setString(4, this.getDocumento());
            ps.setString(5, this.getDdd());
            ps.setString(6, this.getTelefone());
            ps.setString(7, this.getEmail());
            ps.setString(8, this.getLogradouro());
            ps.setString(9, this.getNumero());
            ps.setString(10, this.getComplemento());
            ps.setString(11, this.getBairro());
            ps.setString(12, this.getCidade());
            ps.setString(13, this.getUf());
            ps.setString(14, this.getImagem());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int lastId = rs.getInt(1);
                    //insere o id registrado no banco no objeto
                    this.setId(lastId);

                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<Cliente> ListarTodos() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_ponto; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Cliente> clientes = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt("id"));
                c.setIdusuario(rs.getInt("idusuario"));
                c.setTpRequerente(rs.getString("tprequerente"));
                c.setNome(rs.getString("nome"));
                c.setDocumento(rs.getString("documento"));
                c.setDdd(rs.getString("ddd"));
                c.setTelefone(rs.getString("telefone"));
                c.setEmail(rs.getString("email"));
                c.setUf(rs.getString("uf"));
                c.setBairro(rs.getString("bairro"));
                c.setCidade(rs.getString("cidade"));
                c.setComplemento(rs.getString("complemento"));
                c.setNumero(rs.getString("numero"));
                c.setLogradouro(rs.getString("logradouro"));
                c.setImagem(rs.getString("imagem"));
                c.setDataCadastro(rs.getTimestamp("dtcadastro"));

                clientes.add(c);
            }
            return clientes;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean BuscarPorId() {
        try {
            Connection conn = BancodeDados.getConexao();
            String sql = "SELECT * FROM tb_ponto WHERE id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setLong(1, this.getId());
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                this.setId(rs.getInt("id"));
                this.setIdusuario(rs.getInt("idusuario"));
                this.setTpRequerente(rs.getString("tprequerente"));
                this.setNome(rs.getString("nome"));
                this.setDocumento(rs.getString("documento"));
                this.setDdd(rs.getString("ddd"));
                this.setTelefone(rs.getString("telefone"));
                this.setEmail(rs.getString("email"));
                this.setUf(rs.getString("uf"));
                this.setBairro(rs.getString("bairro"));
                this.setCidade(rs.getString("cidade"));
                this.setComplemento(rs.getString("complemento"));
                this.setNumero(rs.getString("numero"));
                this.setLogradouro(rs.getString("logradouro"));
                this.setImagem(rs.getString("imagem"));
                this.setDataCadastro(rs.getTimestamp("dtcadastro"));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
