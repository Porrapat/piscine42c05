/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_sqrt.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ecaceres <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/08/06 13:04:32 by ecaceres          #+#    #+#             */
/*   Updated: 2019/08/06 13:04:33 by ecaceres         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_sqrt(int nb)
{
	unsigned int		sqrt;
	unsigned int		index;

	if (nb < 0)
		return (0);
	if (nb <= 1)
		return (nb);
	index = 0;
	sqrt = index * index;
	while (sqrt <= (unsigned int)nb)
	{
		index++;
		sqrt = index * index;
	}
	index -= 1;
	if (index * index == (unsigned int)nb)
	{
		return (index);
	}
	else
	{
		return (0);
	}
}
